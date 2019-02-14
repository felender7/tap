class Referral < ApplicationRecord
  belongs_to :cvs, optional: true
end
