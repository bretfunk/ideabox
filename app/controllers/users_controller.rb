class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "New User Created!"
      redirect_to "/"
    else
      flash[:notice] = "Error, #{user.errors.key}, #{user.errors.value}"
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
