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

ActiveRecord::Schema.define(version: 20180327100938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "battle_id", null: false
    t.boolean "win", null: false
    t.integer "gachi_power", default: 0, null: false
    t.integer "assist", null: false
    t.integer "death", null: false
    t.integer "kill", null: false
    t.integer "paint", null: false
    t.integer "special", null: false
    t.integer "start_at", null: false
    t.string "rule_name", null: false
    t.integer "stage_id", null: false
    t.string "stage_name", null: false
    t.integer "weapon_id", null: false
    t.string "weapon_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_id"], name: "index_records_on_battle_id", unique: true
    t.index ["rule_name"], name: "index_records_on_rule_name"
    t.index ["stage_id"], name: "index_records_on_stage_id"
    t.index ["stage_name"], name: "index_records_on_stage_name"
    t.index ["user_id"], name: "index_records_on_user_id"
    t.index ["weapon_id"], name: "index_records_on_weapon_id"
    t.index ["weapon_name"], name: "index_records_on_weapon_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
