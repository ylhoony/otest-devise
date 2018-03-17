class OrderStatus < ApplicationRecord
  has_many :account_orders
end
