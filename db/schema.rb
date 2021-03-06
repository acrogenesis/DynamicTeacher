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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141207225053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "answer"
    t.string   "field_type"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "diagnostic_exam_users", force: true do |t|
    t.integer  "diagnostic_exam_id"
    t.integer  "user_id"
    t.float    "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnostic_exam_users", ["diagnostic_exam_id", "user_id"], name: "index_diagnostic_exam_users_on_diagnostic_exam_id_and_user_id", using: :btree
  add_index "diagnostic_exam_users", ["user_id"], name: "index_diagnostic_exam_users_on_user_id", using: :btree

  create_table "diagnostic_exams", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "schedule"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homeworks", force: true do |t|
    t.integer  "level"
    t.string   "hw_type"
    t.string   "subject"
    t.text     "description"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homeworks_users", force: true do |t|
    t.integer  "homework_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.float    "grade"
    t.string   "comment"
    t.datetime "delivered"
  end

  add_index "homeworks_users", ["homework_id", "user_id"], name: "index_homeworks_users_on_homework_id_and_user_id", using: :btree
  add_index "homeworks_users", ["user_id"], name: "index_homeworks_users_on_user_id", using: :btree

  create_table "practices", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "question"
    t.integer  "diagnostic_exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "practice_id"
  end

  add_index "questions", ["diagnostic_exam_id"], name: "index_questions_on_diagnostic_exam_id", using: :btree
  add_index "questions", ["practice_id"], name: "index_questions_on_practice_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
    t.integer  "group_id"
    t.string   "focus"
    t.string   "subject"
    t.integer  "level"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "subject"
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
