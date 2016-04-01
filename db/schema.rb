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

ActiveRecord::Schema.define(version: 20160401052245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "interview_id"
    t.text     "text"
    t.text     "comment"
    t.float    "mark"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "answers", ["interview_id"], name: "index_answers_on_interview_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interview_template_questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "category_id"
    t.integer  "difficulty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "interview_template_questions", ["category_id"], name: "index_interview_template_questions_on_category_id", using: :btree
  add_index "interview_template_questions", ["question_id"], name: "index_interview_template_questions_on_question_id", using: :btree

  create_table "interview_templates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.string   "name"
    t.datetime "appointed_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "body"
    t.string   "title"
    t.integer  "difficulty",  default: 0
    t.integer  "category_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "answers", "interviews"
  add_foreign_key "answers", "questions"
  add_foreign_key "interview_template_questions", "categories"
  add_foreign_key "interview_template_questions", "questions"
end
