class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  before_filter :current_team

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def current_team
    if current_user && session[:current_team]
      @current_team = Team.find(session[:current_team])
    end
  end
end
