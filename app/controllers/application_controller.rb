class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_url, :alert => exception.message
  end
  rescue_from ActionController::RoutingError do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_filter :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end
  
end
