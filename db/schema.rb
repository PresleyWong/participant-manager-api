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

ActiveRecord::Schema[7.0].define(version: 2023_04_06_102022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.boolean "is_archived", default: false
    t.boolean "is_closed", default: false
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

  create_table "settings", force: :cascade do |t|
    t.integer "singleton_guard"
    t.string "header_bg_light_color"
    t.string "header_text_light_color"
    t.string "navbar_bg_light_color"
    t.string "navbar_text_light_color"
    t.string "footer_bg_light_color"
    t.string "footer_text_light_color"
    t.string "primary_button_bg_light_color"
    t.string "primary_button_text_light_color"
    t.string "secondary_button_bg_light_color"
    t.string "secondary_button_text_light_color"
    t.string "info_button_bg_light_color"
    t.string "info_button_text_light_color"
    t.string "primary_outline_button_bg_light_color"
    t.string "primary_outline_button_text_light_color"
    t.string "error_outline_button_bg_light_color"
    t.string "error_outline_button_text_light_color"
    t.string "main_bg_light_color"
    t.string "card_header_bg_light_color"
    t.string "card_header_text_light_color"
    t.string "card_bg_light_color"
    t.string "card_text_light_color"
    t.string "table_header_bg_light_color"
    t.string "table_header_text_light_color"
    t.string "table_strip_odd_bg_light_color"
    t.string "table_strip_even_bg_light_color"
    t.string "table_text_light_color"
    t.string "brother_text_light_color"
    t.string "sister_text_light_color"
    t.string "input_border_light_color"
    t.string "header_bg_dark_color"
    t.string "header_text_dark_color"
    t.string "navbar_bg_dark_color"
    t.string "navbar_text_dark_color"
    t.string "footer_bg_dark_color"
    t.string "footer_text_dark_color"
    t.string "primary_button_bg_dark_color"
    t.string "primary_button_text_dark_color"
    t.string "secondary_button_bg_dark_color"
    t.string "secondary_button_text_dark_color"
    t.string "info_button_bg_dark_color"
    t.string "info_button_text_dark_color"
    t.string "primary_outline_button_bg_dark_color"
    t.string "primary_outline_button_text_dark_color"
    t.string "error_outline_button_bg_dark_color"
    t.string "error_outline_button_text_dark_color"
    t.string "main_bg_dark_color"
    t.string "card_header_bg_dark_color"
    t.string "card_header_text_dark_color"
    t.string "card_bg_dark_color"
    t.string "card_text_dark_color"
    t.string "table_header_bg_dark_color"
    t.string "table_header_text_dark_color"
    t.string "table_strip_odd_bg_dark_color"
    t.string "table_strip_even_bg_dark_color"
    t.string "table_text_dark_color"
    t.string "brother_text_dark_color"
    t.string "sister_text_dark_color"
    t.string "input_border_dark_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["singleton_guard"], name: "index_settings_on_singleton_guard", unique: true
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "events"
  add_foreign_key "appointments", "participants"
  add_foreign_key "appointments", "users"
end
