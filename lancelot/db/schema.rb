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

ActiveRecord::Schema.define(version: 20170101201401) do

  create_table "applications", force: :cascade do |t|
    t.boolean  "hourly"
    t.integer  "freelancer_information_id"
    t.integer  "post_id"
    t.text     "description"
    t.integer  "amount"
    t.string   "payment_protection"
    t.boolean  "acknowledged",              default: false
    t.integer  "weekly_hours"
    t.string   "payment_interval"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "project_start"
    t.datetime "project_end"
  end

  add_index "applications", ["freelancer_information_id"], name: "index_applications_on_freelancer_information_id"
  add_index "applications", ["post_id"], name: "index_applications_on_post_id"

  create_table "contracts", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "application_id"
    t.boolean  "hourly"
    t.integer  "amount"
    t.string   "payment_protection"
    t.boolean  "freelancer_signed",   default: false
    t.boolean  "poster_signed",       default: false
    t.boolean  "freelancer_approved", default: false
    t.boolean  "poster_approved",     default: false
    t.integer  "weekly_hours"
    t.string   "payment_interval"
    t.datetime "project_start"
    t.datetime "project_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "freelancer_informations", force: :cascade do |t|
    t.text     "description"
    t.string   "location"
    t.string   "email"
    t.string   "phone"
    t.string   "skype"
    t.string   "website"
    t.string   "attachment"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "freelancer_informations", ["user_id"], name: "index_freelancer_informations_on_user_id"

  create_table "poster_informations", force: :cascade do |t|
    t.text     "description"
    t.string   "location"
    t.string   "email"
    t.string   "phone"
    t.string   "skype"
    t.string   "website"
    t.string   "attachment"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "poster_informations", ["user_id"], name: "index_poster_informations_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "poster_information_id"
    t.integer  "awarded_to_id"
    t.integer  "budget"
    t.boolean  "hourly"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.string   "years"
    t.integer  "freelancer_information_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "skills", ["freelancer_information_id"], name: "index_skills_on_freelancer_information_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.boolean  "freelancer"
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
    t.datetime "last_active_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
