class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def authorize
    flash[:error] = "You are not authorized to be there." unless current_user
    redirect_to '/login' unless current_user
  end

  def validate_user
    flash[:error] = "You are not authorized to be there." unless current_user.id.to_s == params[:id]
    redirect_to login_path unless current_user.id.to_s == params[:id]
  end

  def owns_ideas
    flash[:error] = "You are not authorized to be there." unless current_user.id.to_s == params[:user_id]
    redirect_to login_path unless current_user.id.to_s == params[:user_id]
  end
end
