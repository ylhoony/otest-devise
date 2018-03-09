class PaymentTerm < ApplicationRecord
  belongs_to :payment_option
  belongs_to :company
  has_many :accounts

  def self.active_payment_terms(current_company)
    self.where(id: current_company.id, active: true).order(name: :asc)  
  end

end
