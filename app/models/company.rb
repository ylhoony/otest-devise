class Company < ApplicationRecord
  has_many :employees
  has_many :users, through: :employees
  belongs_to :currency
  belongs_to :country
  
  has_many :payment_terms
  has_many :freight_terms
  has_many :unit_of_measures
  has_many :warehouses

  has_many :accounts
  has_many :customers
  has_many :suppliers

  validates :name, presence: true
  validates :currency_id, presence: true


end
