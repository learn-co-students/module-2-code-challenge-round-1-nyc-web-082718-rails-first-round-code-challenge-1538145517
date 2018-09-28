class Heroine < ApplicationRecord
  belongs_to :power

  # BONUS
  # validates :name, presence: true
  validates :super_name, uniqueness: true, presence: true

end
