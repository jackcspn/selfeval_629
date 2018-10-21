class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    #ActionController::Parameters.permit_all_parameters = true
  end

  
  # def hello
  #   render html: "&#161 Hola, Mundo!"
  # end
  
  # def goodbye
  #   render html: "Goodbye, World!"
  # end

end

