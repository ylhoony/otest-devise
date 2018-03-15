class Customer < Account
  has_many :account_addresses, as: :account
  has_many :account_contacts, as: :account

end