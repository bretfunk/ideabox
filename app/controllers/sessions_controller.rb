class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect_to '/'
    else
      flash[:notice] = "Error, #{user.errors.key}, #{user.errors.value}"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
