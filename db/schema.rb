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

ActiveRecord::Schema.define(version: 20150627144845) do

  create_table "admins", force: :cascade do |t|
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
  end

  add_index "authors_books", ["author_id"], name: "index_authors_books_on_author_id"
  add_index "authors_books", ["book_id"], name: "index_authors_books_on_book_id"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.integer  "count"
    t.integer  "year"
    t.string   "isnb"
    t.text     "about"
    t.integer  "category_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "short_about"
    t.string   "book_img_file_name"
    t.string   "book_img_content_type"
    t.integer  "book_img_file_size"
    t.datetime "book_img_updated_at"
    t.integer  "rating",                default: 0
  end

  add_index "books", ["category_id"], name: "index_books_on_category_id"

  create_table "carts", force: :cascade do |t|
    t.string   "status",         default: "In progress"
    t.float    "total_price"
    t.integer  "order_books_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "phone"
    t.string   "adress"
    t.string   "name"
  end

  add_index "carts", ["order_books_id"], name: "index_carts_on_order_books_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_books", force: :cascade do |t|
    t.float    "unit_price"
    t.float    "sum_price"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
    t.integer  "cart_id"
  end

end
