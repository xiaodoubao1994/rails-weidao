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

ActiveRecord::Schema.define(version: 20180112013156) do

  create_table "cart_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.integer "count", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "proname"
    t.text "prodesc"
    t.integer "old_price"
    t.integer "new_price"
    t.string "img"
    t.string "img_1"
    t.string "img_2"
    t.string "img_3"
    t.string "img_4"
    t.integer "sales"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "username"
    t.string "userpwd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "users"
end
