class UsersController < ApplicationController
    before_action :authenticate_user!
   
    def edit
       @user = current_user
    end
   
    def update
       @user = current_user
       if @user.authenticate_pin(params[:user][:pin]) && @user.update(user_params)
         redirect_to root_path, notice: 'Dados atualizados com sucesso.'
       else
         render :edit
       end
    end
   
    private
   
    def user_params
       params.require(:user).permit(:name, :pin)
    end
   end
   