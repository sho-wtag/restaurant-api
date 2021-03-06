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

ActiveRecord::Schema.define(version: 20180512111945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dining_tables", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "name"
    t.integer "min_capacity"
    t.integer "max_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_dining_tables_on_restaurant_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "shift_id"
    t.time "reservation_time"
    t.integer "guest_id"
    t.integer "guest_count"
    t.integer "dining_table_id"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.bigint "shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_restaurants_on_shift_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
