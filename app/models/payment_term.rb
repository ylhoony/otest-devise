class PaymentTerm < ApplicationRecord
  belongs_to :payment_option
  belongs_to :company
  has_many :accounts
end
