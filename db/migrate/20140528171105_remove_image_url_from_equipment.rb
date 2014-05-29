class RemoveImageUrlFromEquipment < ActiveRecord::Migration
 def change
    remove_column :equipment, :image_url
  end
end
