class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :rodgings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, uniqueness: true, presence: true

  enum role: {
    general: 0,
    admin: 1
  }
end
