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

ActiveRecord::Schema.define(version: 20161125013656) do

  create_table "book_tags", force: :cascade do |t|
    t.integer "book_id", limit: 4
    t.integer "tag_id",  limit: 4
    t.string  "weight",  limit: 255
  end

  create_table "books", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.string  "author",        limit: 255
    t.text    "summary",       limit: 65535
    t.integer "status_id",     limit: 4
    t.string  "book_position", limit: 255
    t.integer "amount",        limit: 4
    t.integer "category_id",   limit: 4
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "circulates", force: :cascade do |t|
    t.integer  "book_id",          limit: 4
    t.integer  "user_id",          limit: 4
    t.datetime "borrow_date"
    t.datetime "expect_back_date"
    t.datetime "back_date"
    t.integer  "book_status_id",   limit: 4
    t.integer  "status_id",        limit: 4
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "phone_number",       limit: 4
    t.string   "email",              limit: 255
    t.string   "borrow_card",        limit: 255
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.integer  "sign_in_count",      limit: 4
  end

end
