class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      render :index
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  def destroy
    @user.destroy
    render :new
  end
end
