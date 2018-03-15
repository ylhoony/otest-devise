class AccountAddress < ApplicationRecord
  belongs_to :account, polymorphic: true
  belongs_to :country

  has_many :transactions

  validates :phone, presence: true

  def name_with_account
    # binding.pry
    "#{self.account.name} : #{self.company_name}"
  end

end
