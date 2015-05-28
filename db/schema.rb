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

ActiveRecord::Schema.define(version: 20150528202247) do

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_card_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "districts", force: true do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["province_id"], name: "index_districts_on_province_id", using: :btree

  create_table "food_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "object_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "email_1"
    t.string   "email_2"
    t.string   "web_page"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.boolean  "allow_point"
    t.integer  "min_points"
    t.integer  "user_id"
    t.integer  "object_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "restaurants", ["object_type_id"], name: "index_restaurants_on_object_type_id", using: :btree
  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", using: :btree

  create_table "user_addresses", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.boolean  "is_default"
    t.integer  "district_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_addresses", ["district_id"], name: "index_user_addresses_on_district_id", using: :btree
  add_index "user_addresses", ["user_id"], name: "index_user_addresses_on_user_id", using: :btree

  create_table "user_cards", force: true do |t|
    t.string   "card_number"
    t.boolean  "is_default"
    t.integer  "credit_card_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_cards", ["credit_card_type_id"], name: "index_user_cards_on_credit_card_type_id", using: :btree
  add_index "user_cards", ["user_id"], name: "index_user_cards_on_user_id", using: :btree

  create_table "user_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "object_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_favorites", ["object_type_id"], name: "index_user_favorites_on_object_type_id", using: :btree
  add_index "user_favorites", ["user_id"], name: "index_user_favorites_on_user_id", using: :btree

  create_table "user_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_1"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

end
