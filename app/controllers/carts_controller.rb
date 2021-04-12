class CartsController < ApplicationController
       before_action :authenticate_user!

       def update
              product = params[:cart][:product_id]
              quantity = params[:cart][:quantity]

              current_order.add_product(product, quantity)
              redirect_to root_path, notice: "El producto se añadió al carrito con éxito"
       end

       def show
              @order = current_order
       end

       def destroy
              @item = OrderItem.find(params[:item_id])

              @item.order.update(total: @item.order.total - @item.price)
              @item.destroy

              redirect_to cart_path, notice: "Haz eliminado el producto del carro"
       end

       def pay_with_paypal
              order = current_order
              price = order.total
              response = EXPRESS_GATEWAY.setup_purchase(price,
              ip: request.remote_ip,
              return_url: process_paypal_payment_cart_url,
              cancel_return_url: root_path,
              allow_guest_checkout: true,
              currency: "USD"
              )
              payment_method = PaymentMethod.find_by(code: "PEC")
              Payment.create(
                     order_id: order.id,
                     payment_method_id: payment_method.id,
                     state: "processing",
                     total: order.total,
                     token: response.token
              )
              redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
       end

       def process_paypal_payment
              details = EXPRESS_GATEWAY.details_for(params[:token])
              express_purchase_options =
              {
                     ip: request.remote_ip,
                     token: params[:token],
                     payer_id: details.payer_id,
                     currency: "USD"
              }
              price = details.params["order_total"].to_d * 100
              response = EXPRESS_GATEWAY.purchase(price, express_purchase_options)
              if response.success?
                     payment = Payment.find_by(token: response.token)
                     order = payment.order
                     order.state = "completed"
                     payment.state = "completed"
                     ActiveRecord::Base.transaction do
                            order.save!
                            payment.save!
                     end
                     redirect_to root_path, notice: "Compra éxitosa"
              else
                     redirect_to root_path, alert: "Ha habido un problema en procesar el pago, intente nuevamente"
              end
       end

end