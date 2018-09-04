class Book < ApplicationRecord
  has_and_belongs_to_many :disciplines
  belongs_to :language
end
