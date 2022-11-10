class Rodging < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :start_time
    validates :end_time
    validates :shopping_day
    validates :address
  end
end
