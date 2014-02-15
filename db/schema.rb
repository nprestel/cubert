# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140215193440) do

  create_table "equipment", force: true do |t|
    t.string   "equip_name"
    t.text     "description"
    t.string   "mode"
    t.float    "wt_limit_lbs"
    t.float    "cb_limit_cuft"
    t.float    "length1_ins"
    t.float    "width1_ins"
    t.float    "height1_ins"
    t.float    "length2_ins"
    t.float    "width2_ins"
    t.float    "height2_ins"
    t.float    "length3_ins"
    t.float    "width3_ins"
    t.float    "height3_ins"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "equip_image_file_name"
    t.string   "equip_image_content_type"
    t.integer  "equip_image_file_size"
    t.datetime "equip_image_updated_at"
  end

  create_table "pieces", force: true do |t|
    t.integer  "count"
    t.float    "length_ins"
    t.float    "width_ins"
    t.float    "height_ins"
    t.integer  "stackability"
    t.float    "weight_lbs"
    t.float    "volume_cuft"
    t.integer  "shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "piece_name"
    t.float    "gross_volume_cuft"
    t.float    "gross_weight_lbs"
  end

  create_table "shipments", force: true do |t|
    t.integer  "pieces_count"
    t.float    "gross_weight_lbs"
    t.float    "gross_volume_cuft"
    t.string   "equiptype"
    t.float    "wt_util"
    t.float    "cb_util"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
