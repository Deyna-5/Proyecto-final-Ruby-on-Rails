class Product < ApplicationRecord
       has_many :order_items, optional: true
       has_many :orders, through: :order_items
       has_many :comments, optional: true
       has_one_attached :product
       has_many :likes, optional: true
end
