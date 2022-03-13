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

ActiveRecord::Schema.define(version: 2022_03_12_212659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", force: :cascade do |t|
    t.string "dname"
    t.string "dcity"
    t.string "dcounty"
    t.string "dstate"
    t.string "dcountry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_enrollments_on_lesson_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lessname"
    t.string "lessnum"
    t.string "lessfield"
    t.string "startdate"
    t.string "enddate"
    t.string "starttime"
    t.string "endtime"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_lessons_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "sname"
    t.string "street"
    t.string "stown"
    t.string "sstate"
    t.string "szip"
    t.bigint "district_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["district_id"], name: "index_schools_on_district_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "middlename"
    t.string "dob"
    t.string "street"
    t.string "city"
    t.string "zip"
    t.string "pronouns"
    t.string "gender"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "firstn"
    t.string "lastn"
    t.string "teachnum"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enrollments", "lessons"
  add_foreign_key "enrollments", "students"
  add_foreign_key "lessons", "schools"
  add_foreign_key "schools", "districts"
  add_foreign_key "students", "schools"
  add_foreign_key "teachers", "schools"
end
