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

ActiveRecord::Schema.define(version: 20170809184726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "selected_appointment"
    t.integer  "quote_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["quote_id"], name: "index_appointments_on_quote_id", using: :btree
  end

  create_table "autos", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "trim"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "mileage"
    t.index ["user_id"], name: "index_autos_on_user_id", using: :btree
  end

  create_table "quotes", force: :cascade do |t|
    t.decimal  "cost"
    t.string   "comment"
    t.integer  "request_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "service_center_id"
    t.datetime "appointment1"
    t.datetime "appointment2"
    t.datetime "appointment3"
    t.index ["request_id"], name: "index_quotes_on_request_id", using: :btree
    t.index ["service_center_id"], name: "index_quotes_on_service_center_id", using: :btree
  end

  create_table "request_services", force: :cascade do |t|
    t.string   "service"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_request_services_on_request_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.string   "service"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "auto_id"
    t.index ["auto_id"], name: "index_requests_on_auto_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "service_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_centers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "service_center_name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone_number"
    t.string   "country"
    t.string   "url"
    t.index ["email"], name: "index_service_centers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_service_centers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "service_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["service_category_id"], name: "index_services_on_service_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "zipcode"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "quotes"
  add_foreign_key "autos", "users"
  add_foreign_key "quotes", "requests"
  add_foreign_key "quotes", "service_centers"
  add_foreign_key "request_services", "requests"
  add_foreign_key "requests", "autos"
  add_foreign_key "requests", "users"
  add_foreign_key "services", "service_categories"
end
