class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :expire_hsts

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :location, :bio, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:location, :photo])
  end


def expire_hsts
  response.headers["Strict-Transport-Security"] = 'max-age=0'
end
  # app/controllers/application_controller.rb

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end
end
