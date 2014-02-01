class AddEquipImageToEquipment < ActiveRecord::Migration
  def self.up
    add_attachment :equipment, :equip_image
  end

  def self.down
    remove_attachment :equipment, :equip_image
  end
end
