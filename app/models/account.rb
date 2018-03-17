class Account < ApplicationRecord
  belongs_to :company
  belongs_to :currency
  # belongs_to :payment_term
  # belongs_to :warehouse

  # has_many :account_addresses
  # has_many :transactions

  validates :currency_id, presence: true

  def warehouse=(warehouse)
    self.warehouse_id = warehouse.id
    self.save
  end

  def warehouse
    Warehouse.find(self.warehouse_id) if self.warehouse_id
  end

  def payment_term=(payment_term)
    self.payment_term_id = payment_term.id
    self.save
  end

  def payment_term
    PaymentTerm.find(self.payment_term_id) if self.payment_term_id
  end

end
