class AddMaxShipUnitsColumnToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :piece_max_su, :integer
  end
end
