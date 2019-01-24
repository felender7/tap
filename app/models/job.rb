class Job < ApplicationRecord
  searchkick word_start: [:title, :city]

  def search_data
    {title: title, city: city}
  end

  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user , optional: true
end
