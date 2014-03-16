class AddShipmentCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipment_count, :integer
  end
end
