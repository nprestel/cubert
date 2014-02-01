class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :pieces_count
      t.float :gross_weight_lbs
      t.float :gross_volume_cuft
      t.string :equiptype
      t.float :wt_util
      t.float :cb_util

      t.timestamps
    end
  end
end
