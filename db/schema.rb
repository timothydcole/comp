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

ActiveRecord::Schema.define(version: 2018_11_08_002756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bids", force: :cascade do |t|
    t.integer "buy_id"
    t.integer "price"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "buy_ads", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "location"
    t.integer "views"
    t.integer "phone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["user_id"], name: "index_buy_ads_on_user_id"
  end

  create_table "purchase_ads", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sell_ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "new"
    t.index ["sell_ad_id"], name: "index_purchase_ads_on_sell_ad_id"
    t.index ["user_id"], name: "index_purchase_ads_on_user_id"
  end

  create_table "purchase_bids", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "buy_ad_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buy_ad_id"], name: "index_purchase_bids_on_buy_ad_id"
    t.index ["user_id"], name: "index_purchase_bids_on_user_id"
  end

  create_table "sell_ads", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "location"
    t.integer "views"
    t.integer "phone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["user_id"], name: "index_sell_ads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "users"
  add_foreign_key "buy_ads", "users"
  add_foreign_key "purchase_ads", "sell_ads"
  add_foreign_key "purchase_ads", "users"
  add_foreign_key "purchase_bids", "buy_ads"
  add_foreign_key "purchase_bids", "users"
  add_foreign_key "sell_ads", "users"
end
