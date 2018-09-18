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

ActiveRecord::Schema.define(version: 20180912131814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "taskk_id"
  end

  create_table "task_lists", force: :cascade do |t|
    t.integer  "expense"
    t.string   "allocated_to"
    t.datetime "task_list_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "taskks", force: :cascade do |t|
    t.string   "task_consumer_no"
    t.string   "status"
    t.string   "cheque_cash_detail"
    t.string   "instruction"
    t.string   "activity"
    t.string   "allocated_to"
    t.string   "priority"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "customer_name"
    t.string   "customer_phone_number"
    t.text     "customer_address"
    t.string   "customer_area"
    t.string   "customer_flavors"
    t.integer  "customer_machine_count"
    t.integer  "task_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "api_source"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
