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

ActiveRecord::Schema.define(version: 20140223170704) do

  create_table "flows", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "flow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prompts", force: true do |t|
    t.integer  "section_id"
    t.integer  "sequence"
    t.string   "type_of",           limit: 32, default: "text"
    t.text     "instructions"
    t.text     "suggested_answers"
    t.boolean  "multi_response?"
    t.text     "dependencies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "details"
    t.text     "hint"
    t.boolean  "allow_other"
  end

  create_table "replies", force: true do |t|
    t.integer  "prompt_id"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.boolean  "complete",       default: false
    t.boolean  "skipped",        default: false
    t.boolean  "not_applicable", default: false
  end

  create_table "section_statuses", force: true do |t|
    t.integer  "project_id"
    t.integer  "section_id"
    t.integer  "status_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flow_id"
    t.integer  "parent_id"
    t.integer  "level"
    t.integer  "sequence"
    t.text     "description"
  end

end
