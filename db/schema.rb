# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120616160018) do

  create_table "areas", :force => true do |t|
    t.string "name"
  end

  create_table "car_violation_comments", :force => true do |t|
    t.string  "text"
    t.integer "violation_id"
  end

  create_table "car_violations", :force => true do |t|
    t.integer  "car_id"
    t.string   "description"
    t.float    "lat"
    t.float    "long"
    t.integer  "area_id"
    t.integer  "city_id"
    t.string   "address"
    t.string   "state"
    t.integer  "count_good",         :default => 0
    t.integer  "count_bad",          :default => 0
    t.float    "rating"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "cars", :force => true do |t|
    t.string   "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string "name"
  end

end
