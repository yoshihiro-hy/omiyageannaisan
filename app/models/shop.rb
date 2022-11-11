class Shop < ApplicationRecord
  belongs_to :rodging

  with_options presence: true do
    validates :name
    validates :address
  end
end
