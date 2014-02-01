class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :description
      t.string :mode
      t.float :wt_limit_lbs
      t.float :cb_limit_cuft
      t.float :length1_ins
      t.float :width1_ins
      t.float :height1_ins
      t.float :length2_ins
      t.float :width2_ins
      t.float :height2_ins
      t.float :length3_ins
      t.float :width3_ins
      t.float :height3_ins
      t.string :image_url

      t.timestamps
    end
  end
end
