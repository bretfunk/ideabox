class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :update, :show]
  # before_action :validate_user, :only => :show
  before_action :validate_user, except: [:new]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "New User Created!"
      redirect_to user
    else
      flash[:error] = "Error, #{user.errors.keys}, #{user.errors.values}"
      redirect_to '/signup'
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      flash[:error] = "Error, #{@user.errors.keys}, #{@user.errors.values}"
      render :edit
    end
  end

  def destroy
    session[:user_id] = nil
    @user.destroy
    flash[:success] = "Account Deleted!"
    redirect_to '/signup'
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end
end
