class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :count
      t.float :length_ins
      t.float :width_ins
      t.float :height_ins
      t.integer :stackability
      t.float :weight_lbs
      t.float :volume_cuft
      t.integer :shipment_id

      t.timestamps
    end
  end
end
