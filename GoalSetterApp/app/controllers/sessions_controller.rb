class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ['Invalid Creds']
      render :new
    end
  end

  def destroy
    current_user.reset_token!
    session[:session_token] = nil
    redirect_to root_url
  end
end
