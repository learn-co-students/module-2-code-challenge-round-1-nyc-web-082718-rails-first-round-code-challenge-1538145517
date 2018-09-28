class Power < ApplicationRecord
  has_many :heroines
  validates :name, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true
end
