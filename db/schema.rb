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

ActiveRecord::Schema.define(version: 20150714200539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "f_name",                    null: false
    t.string   "l_name",                    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "gender"
    t.string   "client_alias"
    t.text     "about"
    t.integer  "zip",                       null: false
    t.integer  "progress",      default: 0
    t.integer  "caseworker_id"
  end

  create_table "clients_donors", id: false, force: :cascade do |t|
    t.integer "donor_id",  null: false
    t.integer "client_id", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string  "destination", null: false
    t.integer "client_id",   null: false
  end

  create_table "donations", force: :cascade do |t|
    t.decimal  "amount",     precision: 7, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "donor_id",                                         null: false
    t.integer  "client_id",                                        null: false
    t.integer  "goal_id",                                          null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string   "card_type"
    t.datetime "card_start_date"
    t.decimal  "cost",            precision: 7, scale: 2, default: 0.0
    t.string   "status",                                  default: "open"
    t.integer  "client_id",                                                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "type"
    t.string   "f_name",                                                null: false
    t.string   "l_name",                                                null: false
    t.string   "email",                                                 null: false
    t.string   "password_digest",                                       null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.decimal  "funds_remaining", precision: 7, scale: 2, default: 0.0
    t.decimal  "funds_spent",     precision: 7, scale: 2, default: 0.0
    t.string   "agency"
  end

end
