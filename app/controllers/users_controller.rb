class UsersController < ApplicationController
       before_action :set_user, only: [:destroy, :become_admin]
       before_action :authenticate_user!

       def destroy
              @user.destroy
              respond_to do |format|
                     format.html { redirect_to dashboard_path, notice: "El usuario fue eliminado con éxito" }
              end
       end

       def become_admin
              @user.toggle!(:admin)
              redirect_to dashboard_path
       end

       def show
              
       end

       private
              def set_user
                     @user = User.find(params[:id])
              end

end