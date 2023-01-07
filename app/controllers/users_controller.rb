class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to categories_path
    else
      render :sign_up
    end
  end

  def log_in
    @user = User.new
  end

  def authenticate
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      redirect_to categories_path
    else
      render :log_in
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
