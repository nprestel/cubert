class FixPiecesColumnName < ActiveRecord::Migration
  def change
    rename_column :pieces,  :name, :piece_name
  end
end
