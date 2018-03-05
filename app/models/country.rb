class Country < ApplicationRecord
  has_many :companies

  validates :alpha_2_code, length: { is: 2 }, presence: true, uniqueness: true
  validates :alpha_3_code, length: { is: 3 }, presence: true, uniqueness: true
  validates :numeric_code, length: { is: 3 }, presence: true, uniqueness: true

  before_save :upcase_code

  def upcase_code
    self.alpha_2_code.upcase!
    self.alpha_3_code.upcase!
  end

end
