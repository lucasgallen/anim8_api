# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_25_152038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string "access_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["access_token"], name: "index_api_keys_on_access_token", unique: true
  end

  create_table "session_groups", force: :cascade do |t|
    t.boolean "image_ready", default: true, null: false
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "image_updated_at", default: "2020-11-16 14:46:25", null: false
    t.index ["slug"], name: "index_session_groups_on_slug", unique: true
  end

  create_table "shared_images", force: :cascade do |t|
    t.bigint "session_group_id"
    t.string "data_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "colors", default: "{}", null: false
    t.index ["session_group_id"], name: "index_shared_images_on_session_group_id"
  end

end
