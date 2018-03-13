class AccountContact < ApplicationRecord
  belongs_to :account, polymorphic: true

  validates :phone, presence: true

end
