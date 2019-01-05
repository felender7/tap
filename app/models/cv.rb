class Cv < ApplicationRecord
  extend FriendlyId
  friendly_id :id_passport, use: :slugged
  validates :identification_type, presence: true
  validates :id_passport, presence: true, length:{minimum: 2}, uniqueness:true
  validates :date_of_birth, presence: true
  validates :place_of_birth, presence: true
  validates :disability, presence: true
  validates :education_type, presence: true
  validates :gender, presence: true
  validates :ethnicity, presence: true
  has_one_attached :avatar
  belongs_to :user , optional: true
end
