class AddLiquidCubeUtilizationToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :lqcb_util, :float
  end
end
