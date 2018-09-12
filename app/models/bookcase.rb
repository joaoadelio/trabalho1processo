class Bookcase < ApplicationRecord
  has_many :books
  belongs_to :library
  belongs_to :user
end
