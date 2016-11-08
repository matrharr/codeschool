class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'application'
  before_filter :set_constants

  def set_constants
    @categories = Category.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    p @current_user
  end


  def admin
    @admin ||= User.find_by(id: session[:user_id], admin: true) if session[:user_id]
  end

  def admin_user
    current_user
    if @current_user && @current_user.admin
        @admin_user = @current_user
    else
      redirect_to '/login' 
    end
  end


  def authorize
    admin_user
    if !@admin_user
      redirect_to '/login'
    end

  end

  helper_method :current_user
  helper_method :admin
end
