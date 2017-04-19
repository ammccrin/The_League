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

ActiveRecord::Schema.define(version: 20170418153029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "match_id",   null: false
    t.integer  "game_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_games_on_match_id", using: :btree
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "num_of_weeks",                null: false
    t.string   "playoffs",                    null: false
    t.string   "password",                    null: false
    t.integer  "curr_week",       default: 1
    t.integer  "admin_id",                    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "games_per_match"
    t.index ["admin_id"], name: "index_leagues_on_admin_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "team1_id",                null: false
    t.integer  "team2_id",                null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "league_id"
    t.integer  "week_id"
    t.text     "result",     default: [],              array: true
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "team_id",    null: false
    t.integer  "league_id",  null: false
    t.integer  "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_players_on_league_id", using: :btree
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
  end

  create_table "points", force: :cascade do |t|
    t.integer  "points",     null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "week_id"
    t.index ["team_id"], name: "index_points_on_team_id", using: :btree
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "player_id",  null: false
    t.integer  "game_id",    null: false
    t.integer  "score",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "week_id"
    t.index ["game_id"], name: "index_scores_on_game_id", using: :btree
    t.index ["player_id"], name: "index_scores_on_player_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_teams_on_league_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "league_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "week"
    t.integer  "league_id"
  end

  create_table "weeks_tables", force: :cascade do |t|
    t.integer "week",      null: false
    t.integer "league_id", null: false
    t.index ["league_id"], name: "index_weeks_tables_on_league_id", using: :btree
  end

end
