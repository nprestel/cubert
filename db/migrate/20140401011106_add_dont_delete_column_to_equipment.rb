class AddDontDeleteColumnToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :do_not_delete, :boolean, :default => 'f'
  end
end
