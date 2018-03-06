class PaymentTerm < ApplicationRecord
  belongs_to :payment_option
  has_many :accounts
end
