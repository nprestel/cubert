class AddGrossWeightLbsToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :gross_weight_lbs, :float
  end
end
