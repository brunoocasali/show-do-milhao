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

ActiveRecord::Schema.define(version: 20141107154510) do

  create_table "answers", force: true do |t|
    t.integer  "answers_id"
    t.integer  "question_id"
    t.integer  "subject_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["answers_id"], name: "index_answers_on_answers_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["subject_id"], name: "index_answers_on_subject_id", using: :btree

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "player_id"
    t.string   "token"
    t.string   "secret"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "player_id"
    t.decimal  "worth",                precision: 10, scale: 2, default: 0.0
    t.integer  "jump",       limit: 1,                          default: 3
    t.boolean  "winner",                                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["player_id"], name: "index_games_on_player_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "email"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.text     "description"
    t.integer  "correct_answer_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["correct_answer_id"], name: "index_questions_on_correct_answer_id", using: :btree
  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id", using: :btree

  create_table "rounds", force: true do |t|
    t.integer  "game_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.decimal  "worth",       precision: 10, scale: 2
    t.decimal  "quit",        precision: 10, scale: 2
    t.decimal  "miss",        precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rounds", ["answer_id"], name: "index_rounds_on_answer_id", using: :btree
  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id", using: :btree
  add_index "rounds", ["question_id"], name: "index_rounds_on_question_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
