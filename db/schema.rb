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

ActiveRecord::Schema.define(version: 2023_08_08_091252) do

  create_table "coordinators", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinators_registries", force: :cascade do |t|
    t.integer "registry_id", null: false
    t.integer "coordinator_id", null: false
    t.index ["coordinator_id"], name: "index_coordinators_registries_on_coordinator_id"
    t.index ["registry_id"], name: "index_coordinators_registries_on_registry_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "participant_id", null: false
    t.integer "coordinator_id", null: false
    t.datetime "date_of_enrollment"
    t.string "remarks"
    t.string "contact_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinator_id"], name: "index_enrollments_on_coordinator_id"
    t.index ["participant_id"], name: "index_enrollments_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "gender", limit: 1
    t.string "dob"
    t.integer "registry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registry_id"], name: "index_participants_on_registry_id"
  end

  create_table "registries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "state", default: "closed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "location"], name: "index_registries_on_name_and_location", unique: true
  end

end
