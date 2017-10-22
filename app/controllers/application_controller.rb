class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_product_types

  protected

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || (current_user.admin? ? new_product_path : root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  def set_product_types
    @menu_product_types = ProductType.joins(:sub_product_types).includes(:sub_product_types).all
  end
  def is_admin?
    redirect_to root_path unless current_user.admin?
  end
end
