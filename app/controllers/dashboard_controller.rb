class DashboardController < ApplicationController
       before_action :authenticate_user!

       def index
              @products = Product.all
              @users = User.all
       end
end