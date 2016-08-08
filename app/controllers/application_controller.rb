class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    admin_recipes_path if resource.is_a?(Admin)
  end

  def after_sign_out_path_for(_)
    new_admin_session_path
  end
end
