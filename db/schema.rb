# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_12_175533) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_log_entries", force: :cascade do |t|
    t.string "mood"
    t.integer "depression_score"
    t.integer "anxiety_score"
    t.integer "sleep_score"
    t.integer "energy_levels"
    t.integer "exercise"
    t.string "meditation"
    t.integer "sociability"
    t.string "notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_daily_log_entries_on_user_id"
  end

  create_table "microdose_log_entries", force: :cascade do |t|
    t.string "mood_before"
    t.string "mood_after"
    t.string "environment"
    t.float "dosage"
    t.integer "intensity"
    t.integer "sociability"
    t.string "journal_prompt"
    t.string "journal_entry"
    t.string "other_notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_microdose_log_entries_on_user_id"
  end

  create_table "protocols", force: :cascade do |t|
    t.string "name"
    t.integer "days_between_dose"
    t.string "dose_days"
    t.float "dosage"
    t.string "description"
    t.integer "protocol_duration"
    t.integer "break_duration"
    t.string "other_notes"
    t.integer "status", default: 0
    t.integer "created_by", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "ip_address"
    t.boolean "data_sharing"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "protocol_id", null: false
    t.index ["protocol_id"], name: "index_users_on_protocol_id"
  end

  add_foreign_key "users", "protocols"
end
