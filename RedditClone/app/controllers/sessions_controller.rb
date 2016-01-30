class SessionsController < ApplicationController
  before_action :require_logout, except: [:destroy]

  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["invalid credentials"]
      redirect_to new_session_url
    end
  end

  def new
    @user = User.new
  end

  def destroy
    if current_user
      logout_user!(current_user)
    end
    redirect_to root_url
  end
end
