class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(email: params[:user][:email], password: params[:user][:password])
    if @user
      flash[:notice] = "You have logged in"
      login!(@user)
      redirect_to root_url
    else
      flash[:errors] = "User #{@user.email} does not exist"
      render :new
    end
  end


  def destroy
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
