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

ActiveRecord::Schema.define(version: 20150613192814) do

  create_table "abouts", force: true do |t|
    t.text     "history"
    t.text     "mision"
    t.text     "vision"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "items", force: true do |t|
    t.string   "name"
    t.decimal  "unit_cost",          precision: 19, scale: 6
    t.decimal  "unit_price",         precision: 19, scale: 6
    t.integer  "restaurant_id"
    t.integer  "item_category_id"
    t.integer  "food_category_id"
    t.integer  "object_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "items", ["food_category_id"], name: "index_items_on_food_category_id", using: :btree
  add_index "items", ["item_category_id"], name: "index_items_on_item_category_id", using: :btree
  add_index "items", ["object_type_id"], name: "index_items_on_object_type_id", using: :btree
  add_index "items", ["restaurant_id"], name: "index_items_on_restaurant_id", using: :btree

  create_table "local_cards", force: true do |t|
    t.integer  "local_id"
    t.integer  "credit_card_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "local_cards", ["credit_card_type_id"], name: "index_local_cards_on_credit_card_type_id", using: :btree
  add_index "local_cards", ["local_id"], name: "index_local_cards_on_local_id", using: :btree

  create_table "local_deliveries", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "local_id"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "local_deliveries", ["district_id"], name: "index_local_deliveries_on_district_id", using: :btree
  add_index "local_deliveries", ["local_id"], name: "index_local_deliveries_on_local_id", using: :btree

  create_table "local_photos", force: true do |t|
    t.integer  "index"
    t.integer  "local_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "local_photos", ["local_id"], name: "index_local_photos_on_local_id", using: :btree

  create_table "locals", force: true do |t|
    t.string   "name"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "email_1"
    t.string   "email_2"
    t.text     "description"
    t.boolean  "allow_delivery"
    t.boolean  "allow_parking"
    t.boolean  "allow_reservation"
    t.boolean  "allow_credit_card"
    t.integer  "restaurant_id"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locals", ["district_id"], name: "index_locals_on_district_id", using: :btree
  add_index "locals", ["restaurant_id"], name: "index_locals_on_restaurant_id", using: :btree

  create_table "menus", force: true do |t|
    t.date     "menu_date"
    t.integer  "stock"
    t.integer  "local_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["item_id"], name: "index_menus_on_item_id", using: :btree
  add_index "menus", ["local_id"], name: "index_menus_on_local_id", using: :btree

  create_table "object_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_cards", force: true do |t|
    t.integer  "order_id"
    t.integer  "user_card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_cards", ["order_id"], name: "index_order_cards_on_order_id", using: :btree
  add_index "order_cards", ["user_card_id"], name: "index_order_cards_on_user_card_id", using: :btree

  create_table "order_deliveries", force: true do |t|
    t.integer  "order_id"
    t.integer  "user_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_deliveries", ["order_id"], name: "index_order_deliveries_on_order_id", using: :btree
  add_index "order_deliveries", ["user_address_id"], name: "index_order_deliveries_on_user_address_id", using: :btree

  create_table "order_details", force: true do |t|
    t.integer  "quantity"
    t.decimal  "unit_price", precision: 19, scale: 6
    t.decimal  "total",      precision: 19, scale: 6
    t.integer  "order_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_details", ["menu_id"], name: "index_order_details_on_menu_id", using: :btree
  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.date     "order_date"
    t.decimal  "total_discount",  precision: 19, scale: 6
    t.decimal  "sub_total",       precision: 19, scale: 6
    t.decimal  "igv",             precision: 19, scale: 6
    t.decimal  "total",           precision: 19, scale: 6
    t.integer  "local_id"
    t.integer  "user_id"
    t.integer  "payment_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["local_id"], name: "index_orders_on_local_id", using: :btree
  add_index "orders", ["payment_type_id"], name: "index_orders_on_payment_type_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_types", force: true do |t|
    t.string   "name"
    t.decimal  "discount",   precision: 19, scale: 6
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

  create_table "shopping_carts", force: true do |t|
    t.integer  "quantity"
    t.integer  "menu_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shopping_carts", ["menu_id"], name: "index_shopping_carts_on_menu_id", using: :btree
  add_index "shopping_carts", ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree

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

  create_table "user_points", force: true do |t|
    t.integer  "quantity"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_points", ["restaurant_id"], name: "index_user_points_on_restaurant_id", using: :btree
  add_index "user_points", ["user_id"], name: "index_user_points_on_user_id", using: :btree

  create_table "user_reviews", force: true do |t|
    t.integer  "rating"
    t.text     "comment"
    t.integer  "object_type_id"
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_reviews", ["item_id"], name: "index_user_reviews_on_item_id", using: :btree
  add_index "user_reviews", ["restaurant_id"], name: "index_user_reviews_on_restaurant_id", using: :btree
  add_index "user_reviews", ["user_id"], name: "index_user_reviews_on_user_id", using: :btree

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

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
