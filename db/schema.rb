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

ActiveRecord::Schema.define(version: 20181018195850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: :cascade do |t|
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "trade_date"
    t.string "name"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_dates", force: :cascade do |t|
    t.date "day"
    t.decimal "open"
    t.decimal "high"
    t.decimal "low"
    t.decimal "close"
    t.bigint "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "Average1"
    t.index ["stock_id"], name: "index_trade_dates_on_stock_id"
  end

  add_foreign_key "trade_dates", "stocks"
end
