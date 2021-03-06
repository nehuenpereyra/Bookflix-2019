class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :check_current_profile_exists
    helper_method :current_profile
    helper_method :authenticate_scope!

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:membership_premium, :name, :last_name, :card_number, :card_key, :expiration_month_date, :expiration_year_date, :current_profiles])
      devise_parameter_sanitizer.permit(:account_update, keys: [:membership_premium, :name, :last_name, :card_number, :card_key, :expiration_month_date, :expiration_year_date])
    end

    private

    def after_sign_out_path_for(resource_or_scope)
      cookies[:current_profile_id] = nil
      root_path
    end

    def	check_current_profile_exists
      return if devise_controller? 
      # Si el usuario inició sesión pero no seleccionó ningún perfil
      if subscriber_signed_in? && current_profile.blank?
        # Redirigirlo al path para seleccionar perfil
        redirect_to :controller => 'profiles', :action => 'index'
        #redirect_to profiles_path
      end
    end

    def	current_profile
      Profile.find_by(id: cookies[:current_profile_id])
    end

    def authenticate_scope!
      if !administrator_signed_in? && !subscriber_signed_in?
          send(:"authenticate_subscriber!")
      end
  end
end
