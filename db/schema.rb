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

ActiveRecord::Schema.define(version: 20161009212952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "spot_id",                        null: false
    t.integer  "user_id",                        null: false
    t.integer  "host_id",                        null: false
    t.string   "price_type",                     null: false
    t.integer  "price",                          null: false
    t.time     "start_time",                     null: false
    t.time     "end_time",                       null: false
    t.date     "start_date",                     null: false
    t.date     "end_date",                       null: false
    t.string   "status",     default: "PENDING", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["host_id"], name: "index_bookings_on_host_id", using: :btree
    t.index ["spot_id"], name: "index_bookings_on_spot_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "date_ranges", force: :cascade do |t|
    t.integer  "spot_id",    null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_date_ranges_on_spot_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.string   "url",        null: false
    t.string   "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "author_id",              null: false
    t.integer  "spot_id"
    t.integer  "user_id"
    t.bigint   "rating",     default: 0, null: false
    t.text     "content"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["author_id"], name: "index_reviews_on_author_id", using: :btree
    t.index ["spot_id"], name: "index_reviews_on_spot_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "spots", force: :cascade do |t|
    t.integer  "host_id",                                 null: false
    t.string   "title",        limit: 48,                 null: false
    t.text     "description",                             null: false
    t.float    "lat",                                     null: false
    t.float    "lng",                                     null: false
    t.float    "hourly_rate",             default: 0.0
    t.float    "daily_rate",              default: 0.0
    t.float    "monthly_rate",            default: 0.0
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.float    "width",                   default: 0.0,   null: false
    t.float    "length",                  default: 0.0,   null: false
    t.boolean  "car",                     default: false
    t.boolean  "motorcycle",              default: false
    t.boolean  "van",                     default: false
    t.boolean  "truck",                   default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["host_id"], name: "index_spots_on_host_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "fname",           null: false
    t.string   "lname",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
