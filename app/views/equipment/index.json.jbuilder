json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :name, :description, :mode, :wt_limit_lbs, :cb_limit_cuft, :length1_ins, :width1_ins, :height1_ins, :length2_ins, :width2_ins, :height2_ins, :length3_ins, :width3_ins, :height3_ins, :image_url
  json.url equipment_url(equipment, format: :json)
end
