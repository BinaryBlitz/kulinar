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

ActiveRecord::Schema.define(version: 20160813101520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "days", force: :cascade do |t|
    t.datetime "starts_at",  null: false
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_days_on_recipe_id", using: :btree
  end

  create_table "picks", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "selection_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipe_id"], name: "index_picks_on_recipe_id", using: :btree
    t.index ["selection_id"], name: "index_picks_on_selection_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name",          null: false
    t.text     "description",   null: false
    t.integer  "cooking_time",  null: false
    t.string   "image",         null: false
    t.float    "calories",      null: false
    t.float    "proteins",      null: false
    t.float    "fats",          null: false
    t.float    "carbohydrates", null: false
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_recipes_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                         null: false
    t.text     "description",                  null: false
    t.string   "image",                        null: false
    t.string   "icon",                         null: false
    t.string   "address",                      null: false
    t.string   "phone_number",                 null: false
    t.string   "site",                         null: false
    t.boolean  "featured",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "selections", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.string   "image",       null: false
    t.datetime "starts_at",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.integer  "position",    null: false
    t.integer  "timer"
    t.string   "image"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree
  end

  create_table "tag_groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_taggings_on_recipe_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "tag_group_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["tag_group_id"], name: "index_tags_on_tag_group_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "api_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
  end

  add_foreign_key "days", "recipes"
  add_foreign_key "picks", "recipes"
  add_foreign_key "picks", "selections"
  add_foreign_key "recipes", "restaurants"
  add_foreign_key "steps", "recipes"
  add_foreign_key "taggings", "recipes"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "tag_groups"
end
