class AddWeightUtilColumnToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :piece_wt_util, :float
  end
end
