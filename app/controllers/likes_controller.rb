class LikesController < ApplicationController
       before_action :find_product
       before_action :find_like, only: [:destroy]

       def create
              if already_liked?
                     flash[:notice] = "Solo le puedes dar like una vez a este producto"
              else
                     @product.likes.create(user_id: current_user.id)
              end
              redirect_to root_path
       end

       def destroy
              if !(already_liked?)
                     flash[:notice] = "No le puedes dar unlike"
              else 
                     @like.destroy
              end
              redirect_to root_path
       end

       private
       def already_liked?
              Like.where(user_id: current_user.id, product_id: params[:product_id].exists?)
       end

       def find_like
              @like = @product.likes.find(params[:id])
       end

       def find_product
              @product = Product.find(params[:product_id])
       end

end