class Product < ApplicationRecord
       has_many :order_items
       has_many :orders, through: :order_items
       has_many :comments
       has_one_attached :product
       has_many :likes
end
