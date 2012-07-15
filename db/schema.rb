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

ActiveRecord::Schema.define(:version => 20120715191530) do

  create_table "campaigns", :force => true do |t|
    t.integer "name", :null => false
  end

  create_table "candidates", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "campaign_id",                     :null => false
    t.integer  "candidate_id",                    :null => false
    t.string   "validity"
    t.string   "conn"
    t.string   "msisdn"
    t.string   "guid"
    t.integer  "shortcode"
    t.boolean  "error",        :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "votes", ["campaign_id"], :name => "votes_campaign_id_fk"
  add_index "votes", ["candidate_id"], :name => "votes_candidate_id_fk"

  add_foreign_key "votes", "campaigns", :name => "votes_campaign_id_fk"
  add_foreign_key "votes", "candidates", :name => "votes_candidate_id_fk"

end
