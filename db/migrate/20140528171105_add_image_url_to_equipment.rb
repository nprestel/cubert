class AddImageUrlToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :image_url, :string
  end
end
