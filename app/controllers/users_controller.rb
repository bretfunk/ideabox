class UsersController < ApplicationController
  before_action :validate_user, :only => :show

  def validate_user
  redirect_to courses_path unless current_user.id.to_s == params[:id]
end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "New User Created!"
      redirect_to user
    else
      flash[:notice] = "Error, #{user.errors.key}, #{user.errors.value}"
      redirect_to '/signup'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end
end
