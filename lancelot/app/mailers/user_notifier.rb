class UserNotifier < ApplicationMailer
	default :from => 'noreply@lancelot.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(email, plan)
    @email = email
    mail( :to => @email,
    :subject => 'Thanks for signing up for lancelot' )
  end

  def send_new_application_email(user, post)
  end

  def send_new_job_awarded_email(user, post) 
  end

  def send_new_job_awarded_reminder_email(user, post)
  end

  def send_contract_ready_to_approve_for_poster_email(user, contract)
  end

  def send_contract_ready_to_sign_for_poster_email(user, contract)
  end

  def send_contract_ready_to_sign_for_freelancer_email(user, contract)
  end

  def send_safepay_needed(user, contract)
  end

  def send_safepay_received_for_poster(user, contract)
  end

  def send_safepay_received_for_freelancer(user, contract)
  end

  def payment_failed_email(user, contract)
    @user = user
    @email = @user.email
    subject = 'Payment Failure'
    mail( :to => @email,
    :subject => subject )
  end

  def payment_success_email(user, contract)
    @user = user
    @email = @user.email
    subject = 'Payment Success'
    mail( :to => @email,
    :subject => subject )
  end

end
