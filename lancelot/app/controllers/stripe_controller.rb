class StripeController < ApplicationController
  protect_from_forgery except: :webhook


  # SUBSCRIPTION_PAYMENT_FAILED = "invoice.payment_failed"

  def webhooks

    # StripeLogger.info "Received event with ID: #{params[:id]} Type: #{params[:type]}"
    # render text: "success"
    head 200, content_type: "text/html"
    params = JSON.parse(request.body.read)

    # Retrieving the event from the Stripe API guarantees its authenticity  
    event = Stripe::Event.retrieve(params["id"])

    stripe_id = event.data.object.customer
    subscription = Subscription.where(stripe_id: stripe_id).first
    Account.all.each do |account|
      if account.subscription == subscription
        @account = account
        break
      end
    end
    
    if @account 
      user = @account.admin
      if event.type == "invoice.payment_failed"
        UserNotifier.payment_failed_email(user).deliver
        @account.set_last_failed_payment
      elsif event.type == "invoice.payment_succeeded"
        UserNotifier.payment_success_email(user).deliver
        @account.clear_last_failed_payment if ( @account.last_failed_payment != nil )
      else
        # StripeLogger.info "Webhook received params.inspect. Did not handle this event."  
      end  
    end  

    # status 200
  end  

end