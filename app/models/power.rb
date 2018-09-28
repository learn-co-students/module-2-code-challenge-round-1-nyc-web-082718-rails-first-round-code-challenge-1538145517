class Power < ApplicationRecord
  has_many :heroine, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
