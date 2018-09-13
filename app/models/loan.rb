class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_one :devolution
end
