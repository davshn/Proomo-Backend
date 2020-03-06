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

ActiveRecord::Schema.define(version: 2020_03_06_140337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "commerces", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "offer_id", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_coupons_on_client_id"
    t.index ["offer_id"], name: "index_coupons_on_offer_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_favorites_on_client_id"
    t.index ["product_id"], name: "index_favorites_on_product_id"
  end

  create_table "info_admin_brands", force: :cascade do |t|
    t.bigint "admin_brand_id", null: false
    t.bigint "commerce_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_brand_id"], name: "index_info_admin_brands_on_admin_brand_id"
    t.index ["commerce_id"], name: "index_info_admin_brands_on_commerce_id"
  end

  create_table "info_clients", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_info_clients_on_client_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_notifications_on_client_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "commerce_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commerce_id"], name: "index_offers_on_commerce_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_product_categories_on_category_id"
    t.index ["product_id"], name: "index_product_categories_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "commerce_id", null: false
    t.string "name", null: false
    t.string "image", null: false
    t.decimal "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commerce_id"], name: "index_products_on_commerce_id"
  end

  create_table "purchaces", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "state", default: "CREADO", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_purchaces_on_client_id"
  end

  create_table "purchase_items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "purchace_id", null: false
    t.decimal "quantity", default: "1.0", null: false
    t.decimal "unit_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchase_items_on_product_id"
    t.index ["purchace_id"], name: "index_purchase_items_on_purchace_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "type", default: "Client", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coupons", "offers"
  add_foreign_key "coupons", "users", column: "client_id"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users", column: "client_id"
  add_foreign_key "info_admin_brands", "commerces"
  add_foreign_key "info_admin_brands", "users", column: "admin_brand_id"
  add_foreign_key "info_clients", "users", column: "client_id"
  add_foreign_key "notifications", "users", column: "client_id"
  add_foreign_key "offers", "commerces"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_categories", "users", column: "category_id"
  add_foreign_key "products", "commerces"
  add_foreign_key "purchaces", "users", column: "client_id"
end
