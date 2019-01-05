class Document < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  has_one_attached :file
  belongs_to :user , optional: true
end
