class ProductGroup < ApplicationRecord
  belongs_to :company
  belongs_to :product_category

  has_many :products

  def name_with_category
    "#{self.product_category.name} : #{self.name}"
  end

end
