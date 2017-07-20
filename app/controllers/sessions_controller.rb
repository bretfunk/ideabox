class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Sucessful login"
      redirect_to user
    else
      flash[:error] = "Error, #{user.errors.keys}, #{user.errors.values}"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out"
    redirect_to '/login'
  end

end
