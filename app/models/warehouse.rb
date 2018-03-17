class Warehouse < ApplicationRecord
  belongs_to :company
  belongs_to :country

  has_many :inventories

  validates :name, presence: true
  validates :country_id, presence: true

  def self.active_warehouses(current_company)
    current_company.warehouses.where(active: true).order(name: :asc)
  end

end
