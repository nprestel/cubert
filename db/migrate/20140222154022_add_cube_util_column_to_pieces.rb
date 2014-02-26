class AddCubeUtilColumnToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :piece_cb_util, :float
  end
end
