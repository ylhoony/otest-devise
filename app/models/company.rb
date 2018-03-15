class Company < ApplicationRecord
  belongs_to :currency
  belongs_to :country

  has_many :employees
  has_many :users, through: :employees
  
  has_many :accounts
  has_many :company_addresses
  has_many :customers
  has_many :freight_terms  
  has_many :suppliers
  has_many :payment_terms
  has_many :product_categories
  has_many :product_groups
  has_many :products
  has_many :unit_of_measures
  has_many :warehouses

  validates :name, presence: true
  validates :currency_id, presence: true


end
