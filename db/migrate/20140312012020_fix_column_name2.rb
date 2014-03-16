class FixColumnName2 < ActiveRecord::Migration
  def change
    rename_column :users,  :shipment_count, :shipments_count
  end
end
