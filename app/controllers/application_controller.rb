class ApplicationController < ActionController::Base
  before_filter :redirect_to_domain if Rails.env.production?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar, :name) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:avatar, :name) }
  end

  private

    # Redirect to the appropriate domain i.e. example.com
    def redirect_to_domain
      domain_to_redirect_to = 'www.premedroadmap.com'
      domain_exceptions = ['premedroadmap.com', 'www.premedroadmap.com']
      should_redirect = !(domain_exceptions.include? request.host)
      new_url = "#{request.protocol}#{domain_to_redirect_to}#{request.fullpath}"
      redirect_to new_url, status: :moved_permanently if should_redirect
    end
end