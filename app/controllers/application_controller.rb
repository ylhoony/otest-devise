class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  def require_signed_in?
    return redirect_to new_user_session_path unless user_signed_in?
  end

  def current_company
    current_user.current_company
  end

  def has_current_company?
    return redirect_to companies_path unless current_company
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

end
