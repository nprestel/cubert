# This file should containss all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Equipment.delete_all
# . . .
Equipment.create!(name: 'GM-48CC',
  description: '48 FT. CLIMATE CONTROLED REFER/HEATED',
  mode: 'Ground',
  wt_limit_lbs: 43000,
  cb_limit_cuft: 3296,
  length1_ins: 570,
  width1_ins: 98,
  height1_ins: 102,
  length2_ins: 0,
  width2_ins: 0,
  height2_ins: 0,
  length3_ins: 0,
  width3_ins: 0,
  height3_ins: 0,
  image_url: 'cs.jpg')
# . . . 
Equipment.create!(name: '53Deck',
  description: '53 Deck Trailer',
  mode: 'Ground',
  wt_limit_lbs: 45000,
  cb_limit_cuft: 3715,
  length1_ins: 630,
  width1_ins: 98,
  height1_ins: 52,
  length2_ins: 630,
  width2_ins: 98,
  height2_ins: 52,
  length3_ins: 0,
  width3_ins: 0,
  height3_ins: 0,
  image_url: 'cs.jpg')
# . . . 
Equipment.create!(name: '53NST',
  description: '53 FT NON STANDARD',
  mode: 'Ground',
  wt_limit_lbs: 45000,
  cb_limit_cuft: 3715,
  length1_ins: 530,
  width1_ins: 98,
  height1_ins: 104,
  length2_ins: 100,
  width2_ins: 98,
  height2_ins: 104,
  length3_ins: 0,
  width3_ins: 0,
  height3_ins: 0,
  image_url: 'cs.jpg')
# . . . 
Equipment.create!(name: '20CT',
  description: '20 FT. CONTAINER',
  mode: 'Ocean',
  wt_limit_lbs: 21700,
  cb_limit_cuft: 1158,
  length1_ins: 234,
  width1_ins: 92,
  height1_ins: 93,
  length2_ins: 0,
  width2_ins: 0,
  height2_ins: 0,
  length3_ins: 0,
  width3_ins: 0,
  height3_ins: 0,
  image_url: 'cs.jpg')
# . . . 
Equipment.create!(name: '40CT',
  description: '40 FT. CONTAINER',
  mode: 'Ocean',
  wt_limit_lbs: 42000,
  cb_limit_cuft: 2346,
  length1_ins: 474,
  width1_ins: 92,
  height1_ins: 94,
  length2_ins: 0,
  width2_ins: 0,
  height2_ins: 0,
  length3_ins: 0,
  width3_ins: 0,
  height3_ins: 0,
  image_url: 'cs.jpg')
  
  Equipment.create!(name: '53STUS',
  description: '53 FT. STANDARD - USA',
  mode: 'Ground',
  wt_limit_lbs: 45000,
  cb_limit_cuft: 3715,
  length1_ins: 630,
  width1_ins: 98,
  height1_ins: 104,
  length2_ins: 0,
  width2_ins: 0,
  height2_ins: 0,
  length3_ins: 0,
  width3_ins: 0,
  height3_ins: 0,
  image_url: 'cs.jpg')
# . . . 