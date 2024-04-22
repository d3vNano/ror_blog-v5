class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :password, :password_confirmation, :current_password])
    end

    def sign_up_params
       params.require(:user).permit(:name, :pin, :email, :password, :password_confirmation)
    end

end
   