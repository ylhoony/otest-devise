class PaymentOption < ApplicationRecord
  has_many :payment_terms
end
