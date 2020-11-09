# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      reset_session
      log_in @user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def disp_42
    @num = 'hola como estas'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
