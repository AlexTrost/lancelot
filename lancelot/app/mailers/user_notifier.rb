class UserNotifier < ApplicationMailer
	default :from => 'noreply@lancelot.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    @email = @user.email
    mail( :to => @email,
    :subject => 'Welcome to Lancelot' )
  end

  def send_new_application_email(user, post)
    @user = user
    @email = @user.email
    @post = post
  end

  def send_new_job_awarded_email(user, post)
    @user = user
    @email = @user.email
    @post = post 
  end

  # def send_new_job_awarded_reminder_email(user, post)
  #   @user = user
  #   @email = @user.email
  #   @post = post
  # end

  def send_contract_ready_to_approve_for_poster_email(user, contract)
    @user = user
    @email = @user.email
    @contract = contract
  end

  def send_contract_ready_to_sign_for_freelancer_email(user, contract)
    @user = user
    @email = @user.email
    @contract = contract
  end
  
  def send_contract_ready_to_sign_for_poster_email(user, contract)
    @user = user
    @email = @user.email
    @contract = contract
  end

  def send_safepay_needed(user, contract)
    @user = user
    @email = @user.email
    @contract = contract
  end

  # def send_safepay_received_for_poster(user, contract)
  #   @user = user
  #   @email = @user.email
  #   @contract = contract
  # end

  # def send_safepay_received_for_freelancer(user, contract)
  #   @user = user
  #   @email = @user.email
  #   @contract = contract
  # end

  # def payment_failed_email(user, contract)
  #   @user = user
  #   @contract = contract
  #   @email = @user.email
  #   subject = 'Payment Failure'
  #   mail( :to => @email,
  #   :subject => subject )
  # end

  # def payment_success_email(user, contract)
  #   @user = user
  #   @contract = contract
  #   @email = @user.email
  #   subject = 'Payment Success'
  #   mail( :to => @email,
  #   :subject => subject )
  # end

end
