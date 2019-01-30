class Cv < ApplicationRecord
  extend FriendlyId
  include ZaIdValidator
  validates :phone, presence: true
  friendly_id :id_passport, use: :slugged
  validates :identification_type, presence: true
  validate  :id_passport
  validates_uniqueness_of :id_passport
  validates :date_of_birth, presence: true
  validates :place_of_birth, presence: true
  validates :disability, presence: true
  validates :education_type, presence: true
  validates :gender, presence: true
  validates :ethnicity, presence: true
  validates :job_function, presence: true
  validates :job_industry, presence: true
  validates :availability, presence: true
  validates :salary_range, presence: true
  validate :correct_image_type
  has_one_attached :avatar
  belongs_to :user , optional: true
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  before_save :check_cropping



  def correct_image_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg))
      errors.add(:file, 'Must be a JPEG file')
    end
  end


  def check_cropping
    self.crop_settings = {x: crop_x, y: crop_y, w: crop_w, h: crop_h} if cropping?
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
 end

 def thumbnail(size = '150x150')
   if avatar.attached?
     if cropping?
       dimensions = "#{crop_settings['w']}x#{crop_settings['h']}"
       coord = "#{crop_settings['x']}+#{crop_settings['y']}"
       avatar.variant(
       crop: "#{dimensions}+#{coord}",
       resize: size
       ).processed
     else
       avatar.variant(resize: size).processed
     end
   end
 end #end thumbnail
end
