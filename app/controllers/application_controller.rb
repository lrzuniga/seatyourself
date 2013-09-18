class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def ensure_logged_in
    unless current_diner
      flash[:alert] = "Please log in"
      redirect_to new_session_path
    end
  end

  private

  def current_diner
    @current_diner ||= Diner.find(session[:diner_id]) if session[:diner_id]
  end

  helper_method :current_diner
end
