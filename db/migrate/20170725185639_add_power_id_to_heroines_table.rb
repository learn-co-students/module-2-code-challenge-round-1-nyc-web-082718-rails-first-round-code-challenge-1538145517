class AddPowerIdToHeroinesTable < ActiveRecord::Migration[4.2]
  def change
    add_column :heroines, :power_id, :integer
  end
end
