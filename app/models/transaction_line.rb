class TransactionLine < ApplicationRecord
  belongs_to :account_order
  belongs_to :product

end
