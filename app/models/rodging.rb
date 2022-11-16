class Rodging < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :user

  with_options presence: true do
    validates :address
  end
end
