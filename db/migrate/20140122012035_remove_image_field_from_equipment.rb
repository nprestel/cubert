class RemoveImageFieldFromEquipment < ActiveRecord::Migration
 def change
    remove_column :equipment, :image
  end
end
