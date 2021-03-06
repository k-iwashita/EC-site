class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name,
                                                       :family_name_kana,
                                                       :last_name,
                                                       :last_name_kana,
                                                       :phone_number,
                                                       :postal_code_home,
                                                       :address_home])
  end
  autocomplete :item, :name, full: true
end
