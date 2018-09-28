class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true
end

# t.string "name"
# t.string "super_name"
# t.ingeger "power_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
