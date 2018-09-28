class Heroine < ApplicationRecord
  belongs_to :power

  validates :name, presence: true
  validates :super_name, presence: true
  validates :super_name, uniqueness: true

  # def self.search(search)
  #   where("power LIKE ?", "%#{search}%")
  # end

end
