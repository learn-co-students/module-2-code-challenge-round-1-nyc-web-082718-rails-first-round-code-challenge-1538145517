ActiveRecord::Schema.define(version: 20180928145322) do

  create_table "heroines", force: :cascade do |t|
    t.string "name"
    t.string "super_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "power_id"
  end

  create_table "powers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
