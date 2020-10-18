# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # the authenticate method is provided by has_secure_password in user model
    if user&.authenticate(params[:session][:password])
      reset_session # included rails method
      log_in user   # session_helper method
      redirect_to user_url(user)
    else
      # now method deletes falsh on reload
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    p 'a user logged out'
    log_out
    redirect_to root_url
  end
end
