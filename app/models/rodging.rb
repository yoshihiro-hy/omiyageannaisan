class Rodging < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :user

  with_options presence: true do
    validates :address
    validates :start_time
    validates :end_time
    validates :shopping_day
  end
end
