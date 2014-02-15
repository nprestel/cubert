class FixEquipmentColumnName < ActiveRecord::Migration
  def change
    rename_column :equipment,  :name, :equip_name
  end
end
