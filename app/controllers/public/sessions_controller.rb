# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    user = EndUser.find_by(email: resource[:email])
    flash[:notice] = "Signed up successfully."
    end_user_path(user)
  end

  def after_sign_out_path_for(resource)
    new_end_user_session_path
  end
end
