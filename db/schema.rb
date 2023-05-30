# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_530_053_358) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'messages', force: :cascade do |t|
    t.text 'content'
    t.integer 'project_alliance_id'
    t.integer 'user_id'
    t.boolean 'deletable', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'project_alliances', force: :cascade do |t|
    t.integer 'project_id'
    t.integer 'team_id'
    t.integer 'status', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'name'
    t.integer 'start_date'
    t.integer 'timeline'
    t.integer 'status', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name'
    t.integer 'size'
    t.boolean 'active', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teams_users', id: false, force: :cascade do |t|
    t.bigint 'team_id', null: false
    t.bigint 'user_id', null: false
    t.index %w[team_id user_id], name: 'index_teams_users_on_team_id_and_user_id'
    t.index %w[user_id team_id], name: 'index_teams_users_on_user_id_and_team_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.integer 'role', default: 0
    t.string 'name'
    t.integer 'designation'
    t.boolean 'active', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
