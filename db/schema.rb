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

ActiveRecord::Schema[7.0].define(version: 2023_11_16_111145) do
  create_table "employment_experiences", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employment_experiences_on_user_id"
  end

  create_table "resume_employment_experiences", force: :cascade do |t|
    t.integer "resume_id", null: false
    t.integer "employment_experience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_experience_id"], name: "index_resume_employment_experiences_on_employment_experience_id"
    t.index ["resume_id", "employment_experience_id"], name: "index_experiences_on_resume", unique: true
    t.index ["resume_id"], name: "index_resume_employment_experiences_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "category"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "skill_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id", "user_id"], name: "index_user_skills_on_skill_id_and_user_id", unique: true
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employment_experiences", "users"
  add_foreign_key "resume_employment_experiences", "employment_experiences"
  add_foreign_key "resume_employment_experiences", "resumes"
  add_foreign_key "resumes", "users"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
