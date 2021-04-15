class DashboardController < ApplicationController
       http_basic_authenticate_with name: "Admin", password: "password"
       before_action :authenticate_user!

       def index
              @products = Product.all
              @users = User.all
              @contacts = Contact.all

              @sales = Order.where(state: "completed").group_by_day(:created_at, range: 1.weeks.ago.midnight..Time.now).count
              @new_users = User.group_by_day(:created_at, range: 1.weeks.ago.midnight..Time.now).count
              end
       end
end