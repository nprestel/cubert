class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :name
      t.text :description
      t.float :length_ins
      t.float :width_ins
      t.float :height_ins
      t.float :max_stack_wt_lbs
      t.integer :RRR_IB
      t.integer :RRR_OB
      t.boolean :lock_length
      t.boolean :lock_width
      t.boolean :do_not_delete, :default => false

      t.timestamps
    end
  end
end
