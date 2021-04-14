class DashboardController < ApplicationController
       before_action :authenticate_user!

       def index
              if current_user.admin == true
              @products = Product.all
              @users = User.all
              @sales = Order.where(state: "completed").group_by_day(:created_at, range: 1.weeks.ago.midnight..Time.now).count
              @new_users = User.group_by_day(:created_at, range: 1.weeks.ago.midnight..Time.now).count
              end



       end

       
end