class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :equipment,  :image_url, :image
  end
end
