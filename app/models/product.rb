class Product < ApplicationRecord
    has_many :order_details, dependent: :destroy
    has_many :orders, through: :order_details

end
