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

ActiveRecord::Schema.define(version: 2022_09_01_023640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booked_time_slots", force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "tutee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "class_periods", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "class_schedules", force: :cascade do |t|
    t.integer "student_id"
    t.integer "class_period_id"
    t.integer "subject_id"
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "location_schedules", force: :cascade do |t|
    t.integer "location_id"
    t.datetime "date_start_time"
    t.datetime "date_end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "building"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "school_id"
  end

  create_table "online_resources", force: :cascade do |t|
    t.string "title"
    t.text "url"
    t.integer "owner_id"
    t.integer "subject_id"
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requested_subjects", force: :cascade do |t|
    t.integer "tutee_id"
    t.integer "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tutored_subjects", force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tutoring_time_slots", force: :cascade do |t|
    t.integer "created_by"
    t.integer "tutor_capacity"
    t.integer "tutee_capacity"
    t.boolean "booked_status"
    t.integer "location_id"
    t.datetime "date_start_time"
    t.datetime "date_end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "school"
    t.string "grade"
    t.integer "role"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
