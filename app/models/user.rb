class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :employees
  has_many :companies, through: :employees

  # belongs_to :current_company, class_name: "Company", foreign_key: "current_company_id"

  def current_company=(company_obj)
    self.current_company_id = company_obj.id
    self.save
  end

  def current_company
    Company.find(self.current_company_id) unless self.current_company_id.nil?
  end

end
