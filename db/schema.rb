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

ActiveRecord::Schema.define(version: 20140702021359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "containers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "length_ins"
    t.float    "width_ins"
    t.float    "height_ins"
    t.float    "max_stack_wt_lbs"
    t.integer  "RRR_IB"
    t.integer  "RRR_OB"
    t.boolean  "lock_length"
    t.boolean  "lock_width"
    t.boolean  "do_not_delete",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

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
    t.boolean  "do_not_delete",            default: false
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
    t.float    "piece_cb_util"
    t.float    "piece_wt_util"
    t.integer  "piece_max_su"
    t.float    "piece_lqcb_util"
  end

  create_table "shipments", force: true do |t|
    t.integer  "pieces_count"
    t.float    "gross_weight_lbs"
    t.float    "gross_volume_cuft"
    t.float    "wt_util"
    t.float    "cb_util"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.float    "lqcb_util"
    t.integer  "equipment_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipments_count"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
