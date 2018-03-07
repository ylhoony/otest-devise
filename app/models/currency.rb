class Currency < ApplicationRecord
  has_many :companies
  has_many :accounts

  validates :name, presence: true, uniqueness: true
  validates :code_alpha, length: { is: 3 }, presence: true, uniqueness: true
  validates :code_numeric, length: { is: 3 }, presence: true, uniqueness: true

  before_save :upcase_code, :capitalize_name

  def upcase_code
    self.code_alpha.upcase!
  end

  def capitalize_name
    self.name.capitalize!
  end


end
