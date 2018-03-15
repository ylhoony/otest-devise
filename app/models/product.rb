class Product < ApplicationRecord
  belongs_to :company
  belongs_to :product_type
  belongs_to :product_group
  belongs_to :unit_of_measure

  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  
end
