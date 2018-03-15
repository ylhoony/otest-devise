class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :account_address
  belongs_to :company_address
  belongs_to :warehouse  

end
