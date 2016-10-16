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

ActiveRecord::Schema.define(version: 20160819033134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_outs", force: :cascade do |t|
    t.integer  "item_id",     null: false
    t.integer  "user_id",     null: false
    t.date     "returned_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "item_types", force: :cascade do |t|
    t.string   "name",        limit: 50, null: false
    t.text     "description",            null: false
    t.text     "notes"
    t.date     "retired_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "item_type_id",                                    null: false
    t.string   "name",         limit: 50,                         null: false
    t.decimal  "price",                   precision: 8, scale: 2, null: false
    t.integer  "asset_num"
    t.text     "notes"
    t.date     "retired_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 25, null: false
    t.string   "last_name",       limit: 25, null: false
    t.string   "username",        limit: 25, null: false
    t.string   "password_digest",            null: false
    t.string   "email",           limit: 50, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
