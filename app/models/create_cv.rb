class CreateCv < ApplicationRecord
  extend FriendlyId
  friendly_id :id_number, use: :slugged
end
