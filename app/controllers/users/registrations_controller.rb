class Users::RegistrationsController < Devise::RegistrationsController
    def sign_up_params
       params.require(:user).permit(:name, :pin, :email, :password, :password_confirmation)
    end

end
   