class RemoveEquiptypeFromShipment < ActiveRecord::Migration
  def change
    remove_column :shipments, :equiptype, :string
  end
end
