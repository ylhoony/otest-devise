class Account < ApplicationRecord
  belongs_to :company
  belongs_to :currency
  belongs_to :payment_term

end
