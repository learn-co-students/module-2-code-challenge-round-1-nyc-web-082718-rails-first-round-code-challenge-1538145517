class Heroine < ApplicationRecord
  belongs_to :power
  validates :name, :super_name, uniqueness: true
  validates :name, :super_name, presence: true
end
