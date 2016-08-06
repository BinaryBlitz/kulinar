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

ActiveRecord::Schema.define(version: 20160805110431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "image",                     null: false
    t.integer  "recipes_count", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.integer  "category_id"
    t.index ["category_id"], name: "index_recipes_on_category_id", using: :btree
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

  create_table "users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "api_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_token"], name: "index_users_on_api_token", unique: true, using: :btree
  end

  add_foreign_key "recipes", "categories"
  add_foreign_key "recipes", "restaurants"
  add_foreign_key "steps", "recipes"
end
