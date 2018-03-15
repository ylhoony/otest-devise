class ProductCategory < ApplicationRecord
  belongs_to :company

  has_many :product_groups

  def product_groups_attributes=(product_groups)
    product_groups.each do |i, product_group|
      self.product_groups.find_by(name: product_group[:name]) || self.product_groups.build(product_group)
    end
    self.save
  end

  def self.active_product_categories(current_company)
    current_company.product_categories.where(active: true)
  end
  
end
