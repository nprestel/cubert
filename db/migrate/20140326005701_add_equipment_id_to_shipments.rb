class AddEquipmentIdToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :equipment_id, :integer
  end
end
