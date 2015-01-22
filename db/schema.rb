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

ActiveRecord::Schema.define(version: 20150121235501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributors", force: :cascade do |t|
    t.string   "name"
    t.decimal  "total_amount"
    t.string   "cycle"
    t.integer  "legislator_id",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.decimal  "employee_amount"
    t.decimal  "direct_amount"
    t.integer  "sunlight_id"
  end

  create_table "legislators", force: :cascade do |t|
    t.string   "bioguide_id"
    t.boolean  "in_office"
    t.string   "party"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "nickname"
    t.string   "gender"
    t.string   "state"
    t.string   "title"
    t.string   "chamber"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.string   "youtube_id"
    t.string   "phone"
    t.string   "office"
    t.string   "website"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "zipcode"
  end

end
