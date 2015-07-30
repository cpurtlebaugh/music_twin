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

ActiveRecord::Schema.define(version: 20150730001044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "twin_id"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "twins", force: :cascade do |t|
    t.string   "name"
    t.string   "mbid"
    t.string   "image_uri"
    t.text     "rankings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twins_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "twin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "twins_users", ["twin_id"], name: "index_twins_users_on_twin_id", using: :btree
  add_index "twins_users", ["user_id"], name: "index_twins_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "twins_users", "twins"
  add_foreign_key "twins_users", "users"
end
