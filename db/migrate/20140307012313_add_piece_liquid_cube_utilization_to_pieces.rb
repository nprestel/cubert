class AddPieceLiquidCubeUtilizationToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :piece_lqcube_util, :float
  end
end
