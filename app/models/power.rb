class Power < ApplicationRecord

  has_many :heroines, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

end
