class AddGrossVolumeCuftToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :gross_volume_cuft, :float
  end
end
