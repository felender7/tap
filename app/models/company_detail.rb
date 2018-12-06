class CompanyDetail < ApplicationRecord
  extend FriendlyId
  friendly_id :company_name, use: :slugged

  belongs_to :user , optional: true
  has_one_attached :company_logo
  validates :company_name, presence: true
  has_many :jobs, dependent: :destroy
end
