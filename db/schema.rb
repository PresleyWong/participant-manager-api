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

ActiveRecord::Schema[7.0].define(version: 2023_01_16_070319) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.string "language", null: false
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_appointments_on_event_id"
    t.index ["participant_id", "event_id"], name: "index_appointments_on_participant_id_and_event_id", unique: true
    t.index ["participant_id"], name: "index_appointments_on_participant_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "attachments"
  end

  create_table "participants", force: :cascade do |t|
    t.string "gender", null: false
    t.string "english_name", null: false
    t.string "chinese_name"
    t.string "email"
    t.bigint "phone"
    t.string "college"
    t.integer "academic_year"
    t.string "locality", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_participants_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "is_admin", default: false
    t.string "locality", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "appointments", "events"
  add_foreign_key "appointments", "participants"
  add_foreign_key "appointments", "users"
end
