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

ActiveRecord::Schema.define(version: 20170417074234) do

  create_table "avatars", force: :cascade do |t|
    t.text     "img_url"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_questions", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "question_id"
    t.integer  "selected_answer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["game_id"], name: "index_game_questions_on_game_id"
    t.index ["question_id"], name: "index_game_questions_on_question_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "rules_id"
    t.string   "status"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rules_id"], name: "index_games_on_rules_id"
  end

  create_table "played_games", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_played_games_on_game_id"
    t.index ["player_id"], name: "index_played_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "avatar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_players_on_avatar_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.string   "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string   "name"
    t.integer  "questions_amount"
    t.integer  "seconds_per_question"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
