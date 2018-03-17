class AccountOrder < ApplicationRecord
  belongs_to :account
  belongs_to :account_address
  belongs_to :company_address
  belongs_to :order_status
  belongs_to :warehouse
  
  has_many :transaction_lines
end
