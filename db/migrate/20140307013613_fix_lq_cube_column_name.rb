class FixLqCubeColumnName < ActiveRecord::Migration
  def change
    rename_column :pieces,  :piece_lqcube_util, :piece_lqcb_util
  end
end
