class AddAttachmentImageToContainers < ActiveRecord::Migration
  def self.up
    change_table :containers do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :containers, :image
  end
end
