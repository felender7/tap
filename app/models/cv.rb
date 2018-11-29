class Cv < ApplicationRecord
  extend FriendlyId
  friendly_id :id_passport, use: :slugged

  has_one_attached :avatar
  belongs_to :user , optional: true
end
