class AddNameColumnToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :name, :string
  end
end
