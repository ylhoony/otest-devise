class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_signed_in?
    return redirect_to new_user_session_path unless user_signed_in?
  end

end
