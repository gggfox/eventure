class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # the authenticate method is provided by has_secure_password in user model
    if user&.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session # included rails method
      log_in user   # session_helper method
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to forwarding_url || events_url
    else
      # now method deletes falsh on reload
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? #conditional allows us to have multiple windows open
    redirect_to root_url
  end
end
