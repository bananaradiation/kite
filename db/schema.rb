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

ActiveRecord::Schema.define(version: 20140602030848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "loc_x",       precision: 10, scale: 0
    t.decimal  "loc_y",       precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "rating",                                default: 0
    t.decimal  "avg_vote",    precision: 10, scale: 10, default: 0.0
    t.integer  "num_votes",                             default: 0
    t.string   "location"
  end

  add_index "activities", ["category_id"], name: "index_activities_on_category_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "activity_statuses", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_statuses", ["activity_id"], name: "index_activity_statuses_on_activity_id", using: :btree
  add_index "activity_statuses", ["user_id"], name: "index_activity_statuses_on_user_id", using: :btree

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "requirements"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  create_table "badges_users", id: false, force: true do |t|
    t.integer "badge_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "badges_users", ["badge_id", "user_id"], name: "index_badges_users_on_badge_id_and_user_id", using: :btree
  add_index "badges_users", ["user_id", "badge_id"], name: "index_badges_users_on_user_id_and_badge_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["activity_id"], name: "index_comments_on_activity_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "url"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["activity_id"], name: "index_photos_on_activity_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.boolean  "logged_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password"
  end

  create_table "votes", force: true do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["activity_id"], name: "index_votes_on_activity_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
