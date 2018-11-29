class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable,  :rememberable, :validatable, :omniauthable

  has_person_name
  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_many :cvs, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :company_details, dependent: :destroy
end
