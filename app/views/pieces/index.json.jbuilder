json.array!(@pieces) do |piece|
  json.extract! piece, :id, :count, :length_ins, :width_ins, :height_ins, :stackability, :weight_lbs, :volume_cuft, :shipment_id
  json.url piece_url(piece, format: :json)
end
