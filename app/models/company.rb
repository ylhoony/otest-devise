class Company < ApplicationRecord
  has_many :employees
  has_many :users, through: :employees
  belongs_to :currency
  belongs_to :country
  has_many :accounts

  validates :name, presence: true
  validates :currency_id, presence: true




end
