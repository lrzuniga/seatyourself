class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  def current_diner
    @current_diner ||= Diner.find(session[:diner_id]) if session[:diner_id]
  end

  helper_method :current_diner
end
