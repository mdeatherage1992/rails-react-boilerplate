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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", primary_key: "batch_id", force: :cascade do |t|
    t.string "batch_name", limit: 20, null: false
    t.string "batch_int", limit: 20, null: false
    t.text "batch_notes", array: true
    t.datetime "date_added"
    t.text "batch_mea"
  end

  create_table "strains", primary_key: "strain_id", force: :cascade do |t|
    t.string "strain_name", limit: 20, null: false
    t.string "strain_feeling", limit: 20, null: false
    t.text "strain_batches", array: true
    t.text "strain_notes", array: true
    t.datetime "date_added"
  end



end
