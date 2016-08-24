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

ActiveRecord::Schema.define(version: 20160820220712) do

  create_table "actions", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "position"
    t.integer  "action_index", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "actions", ["game_id"], name: "index_actions_on_game_id"
  add_index "actions", ["player_id"], name: "index_actions_on_player_id"

  create_table "games", force: :cascade do |t|
    t.string   "opponent"
    t.datetime "gametime",   null: false
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["season_id"], name: "index_games_on_season_id"

  create_table "player_stats", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "fgm",        default: 0
    t.integer  "fga",        default: 0
    t.integer  "tpm",        default: 0
    t.integer  "tpa",        default: 0
    t.integer  "ftm",        default: 0
    t.integer  "fta",        default: 0
    t.integer  "oreb",       default: 0
    t.integer  "dreb",       default: 0
    t.integer  "ast",        default: 0
    t.integer  "tov",        default: 0
    t.integer  "stl",        default: 0
    t.integer  "blk",        default: 0
    t.integer  "foul",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "player_stats", ["game_id"], name: "index_player_stats_on_game_id"
  add_index "player_stats", ["player_id"], name: "index_player_stats_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "image_url"
    t.text     "bio"
    t.integer  "height"
    t.integer  "weight"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rosters", ["player_id"], name: "index_rosters_on_player_id"
  add_index "rosters", ["season_id"], name: "index_rosters_on_season_id"

  create_table "scores", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "point_q1",          default: 0
    t.integer  "point_q2",          default: 0
    t.integer  "point_q3",          default: 0
    t.integer  "point_q4",          default: 0
    t.integer  "point_total",       default: 0
    t.integer  "point_op_q1",       default: 0
    t.integer  "point_op_q2",       default: 0
    t.integer  "point_op_q3",       default: 0
    t.integer  "point_op_q4",       default: 0
    t.integer  "point_op_total",    default: 0
    t.integer  "recording_quarter", default: 1
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "scores", ["game_id"], name: "index_scores_on_game_id"

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_current_season", default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "team_stats", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "fgm",        default: 0
    t.integer  "fga",        default: 0
    t.integer  "tpm",        default: 0
    t.integer  "tpa",        default: 0
    t.integer  "ftm",        default: 0
    t.integer  "fta",        default: 0
    t.integer  "oreb",       default: 0
    t.integer  "dreb",       default: 0
    t.integer  "ast",        default: 0
    t.integer  "tov",        default: 0
    t.integer  "stl",        default: 0
    t.integer  "blk",        default: 0
    t.integer  "foul",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "team_stats", ["game_id"], name: "index_team_stats_on_game_id"

end
