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

ActiveRecord::Schema.define(version: 2026_06_25_115415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "email", limit: 100, default: "", null: false
    t.string "username", limit: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["username"], name: "index_admin_users_on_username"
  end

  create_table "admin_users_pages", id: false, force: :cascade do |t|
    t.bigint "admin_user_id", null: false
    t.bigint "page_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_user_id", "page_id"], name: "index_admin_users_pages_on_admin_user_id_and_page_id"
    t.index ["admin_user_id"], name: "index_admin_users_pages_on_admin_user_id"
    t.index ["page_id"], name: "index_admin_users_pages_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.string "name"
    t.string "permalink"
    t.integer "position"
    t.boolean "visible", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permalink"], name: "index_pages_on_permalink"
    t.index ["subject_id"], name: "index_pages_on_subject_id"
  end

  create_table "section_edits", force: :cascade do |t|
    t.bigint "admin_user_id", null: false
    t.bigint "section_id", null: false
    t.string "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_user_id"], name: "index_section_edits_on_admin_user_id"
    t.index ["section_id"], name: "index_section_edits_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.string "name"
    t.integer "position"
    t.boolean "visible", default: false
    t.string "content_type"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_sections_on_page_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", limit: 20
    t.integer "position"
    t.boolean "visible", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "admin_users_pages", "admin_users"
  add_foreign_key "admin_users_pages", "pages"
  add_foreign_key "pages", "subjects"
  add_foreign_key "section_edits", "admin_users"
  add_foreign_key "section_edits", "sections"
  add_foreign_key "sections", "pages"
end
