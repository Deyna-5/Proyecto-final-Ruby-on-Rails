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

end