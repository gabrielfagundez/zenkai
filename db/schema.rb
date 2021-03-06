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

ActiveRecord::Schema.define(:version => 20160412191637) do

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "url"
    t.string   "color"
    t.string   "type"
    t.integer  "min_estimates"
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id", "user_id"], :name => "index_projects_users_on_project_id_and_user_id"

  create_table "sprint_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sprint_id"
    t.float    "code_review"
    t.float    "estimation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sprints", :force => true do |t|
    t.date     "start"
    t.date     "sprint_end"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "target_points"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.float    "points"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.float    "real_hours"
    t.float    "estimated_hours"
    t.string   "type"
    t.datetime "completed_at"
    t.integer  "sprint_id"
    t.string   "description"
  end

  create_table "user_ticket_estimates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.float    "points"
    t.integer  "estimated_hours"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
    t.string   "authentication_token"
    t.boolean  "approved"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
