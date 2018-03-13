class AccountAddress < ApplicationRecord
  belongs_to :account, polymorphic: true
  belongs_to :country

  validates :phone, presence: true

end
