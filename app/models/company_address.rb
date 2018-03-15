class CompanyAddress < ApplicationRecord
  belongs_to :company
  belongs_to :country

  has_many :transactions
end
