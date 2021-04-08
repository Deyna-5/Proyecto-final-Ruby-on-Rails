class DashboardController < ApplicationController
       before_action :authenticate_user!

       def index
              if current_user.admin == true
              @products = Product.all
              @users = User.all
              end
       end

       
end