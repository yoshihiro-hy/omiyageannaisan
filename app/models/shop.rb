class Shop < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :rodging

  validates :address, presence: true
end
