class AddUserIdColumnToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :user_id, :integer
  end
end
