class AddNameToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :name, :string
  end
end
