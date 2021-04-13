class ApplicationController < ActionController::Base

       def current_order
              if current_user
                     order = Order.where(user_id: current_user.id).where(state: "created").last
                     if order.nil?
                            order = Order.create(user: current_user, state: "created")
                     end
                     return order
              end
              nil
       end

       def info_mail(mail:, subject:, message:)
              mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
              ms_params = {
                     from: "noreply@guarapitadulce.cl",
                     to: resource.email,
                     text: message
              }
              mg_client.send_message('sandbox9c1ee9ce41ee43b6b62b8f8534e188cf.mailgun.org', ms_params)
       end

end
