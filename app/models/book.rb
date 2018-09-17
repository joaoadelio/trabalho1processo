require 'carrierwave/orm/activerecord'
class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :disciplines
  belongs_to :language
  belongs_to :bookcase
  has_many :bookings
  has_many :loans
end
