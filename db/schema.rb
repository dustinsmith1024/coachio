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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120618014140) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.integer  "minutes"
    t.boolean  "group"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "activities", ["team_id"], :name => "index_activities_on_team_id"

  create_table "goals", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active"
    t.integer  "team_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "number"
    t.boolean  "player"
    t.string   "position"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "members", ["team_id"], :name => "index_members_on_team_id"

  create_table "plans", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "workout_id"
    t.boolean  "individual"
    t.boolean  "public"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
    t.integer  "reps"
    t.integer  "minutes"
  end

  create_table "practices", :force => true do |t|
    t.date     "scheduled_date"
    t.time     "scheduled_time"
    t.integer  "team_id"
    t.integer  "member_id"
    t.boolean  "track_results"
    t.integer  "workout_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "complete"
    t.text     "notes"
  end

  add_index "practices", ["member_id"], :name => "index_practices_on_member_id"
  add_index "practices", ["team_id"], :name => "index_practices_on_team_id"
  add_index "practices", ["workout_id"], :name => "index_practices_on_workout_id"

  create_table "progresses", :force => true do |t|
    t.integer  "goal_id"
    t.integer  "member_id"
    t.integer  "made"
    t.integer  "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "progresses", ["goal_id"], :name => "index_progresses_on_goal_id"
  add_index "progresses", ["member_id"], :name => "index_progresses_on_member_id"

  create_table "results", :force => true do |t|
    t.integer  "reps"
    t.integer  "practice_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "plan_id"
  end

  add_index "results", ["practice_id"], :name => "index_results_on_practice_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "mascot"
    t.string   "kind"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workouts", :force => true do |t|
    t.string   "name"
    t.boolean  "group"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "workouts", ["team_id"], :name => "index_workouts_on_team_id"

end
