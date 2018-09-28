class Heroine < ApplicationRecord
  belongs_to :power

  validates :name, uniqueness: true
  validates :super_name, uniqueness: true

  def self.search(power_id)
    if power_id
      power = Power.find_by(id: power_id)
      self.where(power_id: power)
    else
      Heroine.all
    end
  end
end
