class CompanyDetail < ApplicationRecord
  extend FriendlyId
  friendly_id :company_name, use: :slugged

  belongs_to :user , optional: true
  has_one_attached :company_logo
  has_one_attached :ck
  has_one_attached :bee
  validates :company_name, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :registration, presence: true
  validates :tel, presence: true
  validates :industry, presence: true
  validate  :correct_image_type_company_logo
  validate  :correct_file_type_ck
  validate  :correct_file_type_bee
  has_many :jobs, dependent: :destroy

   # check if the logo is jpeg
  def correct_image_type_company_logo
    if company_logo.attached? && !company_logo.content_type.in?(%w(image/jpeg))
      errors.add(:company_logo, 'Must be a JPEG file')
    end
  end

 # check if the CK is PDF
  def correct_file_type_ck
    if ck.attached? && !ck.content_type.in?(%w(application/pdf))
      errors.add(:ck, 'Must be a PDF file')
    end
  end

  # check if the BEE is PDF
  def correct_file_type_bee
    if bee.attached? && !bee.content_type.in?(%w(application/pdf))
      errors.add(:bee, 'Must be a PDF file')
    end
  end
end
