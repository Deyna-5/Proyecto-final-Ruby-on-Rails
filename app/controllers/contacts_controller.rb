class ContactsController < ApplicationController
       before_action :find_contact, only: [:destroy]

       def new
              @contact = Contact.new
       end

       def create
              @contact = Contact.create(contact_params)
              redirect_to root_path, notice: "Su peticion se envio de forma éxitosa. ¡Le responderemos lo antes posible!"
       end

       def destroy
              @contact.destroy
              redirect_to dashboard_path, notice: "Se eliminó la peticion éxitosamente"
       end

       private
              def find_contact
                     @contact = Contact.find(params[:id])
              end

              def contact_params
                     params.permit(:user_id, :email, :text)
              end

end