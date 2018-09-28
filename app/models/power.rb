class Power < ApplicationRecord
  has_many :heroines

  # BONUS
  # validates :name, presence: true
  # validates :description, presence: true
end
