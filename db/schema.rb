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

ActiveRecord::Schema.define(version: 2021_09_01_104954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "advertisement_type"
    t.bigint "commerce_id"
    t.string "title"
    t.string "text"
    t.integer "link"
    t.bigint "category_id"
    t.boolean "published", default: false
    t.index ["category_id"], name: "index_advertisements_on_category_id"
    t.index ["commerce_id"], name: "index_advertisements_on_commerce_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "concept_name", default: "Producto"
    t.bigint "principal_category_id"
    t.index ["name"], name: "index_categories_on_name"
    t.index ["principal_category_id"], name: "index_categories_on_principal_category_id"
  end

  create_table "categories_commerces", id: false, force: :cascade do |t|
    t.bigint "commerce_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_categories_commerces_on_category_id"
    t.index ["commerce_id"], name: "index_categories_commerces_on_commerce_id"
  end

  create_table "categories_offers", id: false, force: :cascade do |t|
    t.bigint "offer_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_categories_offers_on_category_id"
    t.index ["offer_id"], name: "index_categories_offers_on_offer_id"
  end

  create_table "commerces", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.float "score"
    t.boolean "published", default: false
    t.bigint "partner_id"
    t.string "city"
    t.index ["partner_id"], name: "index_commerces_on_partner_id"
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
    t.bigint "commerce_id", null: false
    t.string "text", null: false
    t.string "title", null: false
    t.boolean "published", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commerce_id"], name: "index_notifications_on_commerce_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "commerce_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "terms_and_conditions"
    t.boolean "published", default: false
    t.string "image"
    t.integer "discount_value", default: 0
    t.integer "points", default: 0
    t.boolean "by_points", default: false
    t.integer "redeem_points", default: 0
    t.boolean "is_online_product", default: false
    t.integer "price", default: 0
    t.index ["commerce_id"], name: "index_offers_on_commerce_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "documment"
    t.string "documment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_partner_id"
    t.index ["parent_partner_id"], name: "index_partners_on_parent_partner_id"
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
    t.integer "ticket_id"
    t.integer "trazability_code"
    t.string "return_code"
    t.integer "total"
    t.integer "trans_value"
    t.datetime "bank_process_date"
    t.integer "fi_code"
    t.string "fi_name"
    t.integer "payment_system"
    t.integer "invoice"
    t.integer "offer_id"
    t.boolean "validate_sale", default: false
    t.integer "commerce_id"
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

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
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
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.string "last_second_name"
    t.string "user_name"
    t.string "phone"
    t.datetime "birthday"
    t.string "genre"
    t.integer "commerce_ref"
    t.integer "total_points", default: 0
    t.integer "spent_points", default: 0
    t.string "favorite_offers", default: [], array: true
    t.string "city"
    t.string "latitude"
    t.string "longitude"
    t.string "notifications_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "advertisements", "commerces"
  add_foreign_key "categories_commerces", "categories"
  add_foreign_key "categories_commerces", "commerces"
  add_foreign_key "categories_offers", "categories"
  add_foreign_key "categories_offers", "offers"
  add_foreign_key "coupons", "offers"
  add_foreign_key "coupons", "users", column: "client_id"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users", column: "client_id"
  add_foreign_key "info_admin_brands", "commerces"
  add_foreign_key "info_admin_brands", "users", column: "admin_brand_id"
  add_foreign_key "info_clients", "users", column: "client_id"
  add_foreign_key "notifications", "commerces"
  add_foreign_key "offers", "commerces"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_categories", "users", column: "category_id"
  add_foreign_key "products", "commerces"
  add_foreign_key "purchaces", "users", column: "client_id"
end
