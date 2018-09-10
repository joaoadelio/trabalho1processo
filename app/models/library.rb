class Library < ApplicationRecord
  has_many :bookcases
  belongs_to :user
end
