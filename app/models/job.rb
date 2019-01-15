class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user , optional: true
end
