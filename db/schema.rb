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

ActiveRecord::Schema.define(version: 20130818214643) do

  create_table "cities", force: true do |t|
    t.string   "cityname"
    t.string   "statename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "rstid"
    t.string   "rstname"
    t.string   "source"
    t.datetime "sdate",         limit: 255
    t.integer  "trialdays"
    t.string   "plantype"
    t.integer  "monthlyrate"
    t.boolean  "ipadsold"
    t.boolean  "standsold"
    t.integer  "ipadrate"
    t.integer  "standrate"
    t.string   "rstowner"
    t.string   "rstaddress"
    t.string   "rstcity"
    t.string   "rststate"
    t.string   "rstzip"
    t.integer  "rstcontact"
    t.integer  "rstmgrcontact"
    t.string   "rstemail"
    t.string   "paymode"
    t.integer  "salestax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ipadserialno"
    t.integer  "payfreq",                   default: 30
    t.string   "salesid1"
    t.string   "salesid2"
    t.string   "source2"
    t.integer  "commission1"
    t.integer  "commission2"
    t.string   "table37rep"
  end

  create_table "parents", force: true do |t|
    t.string   "parentname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "partentcomm"
  end

  create_table "sales", force: true do |t|
    t.string   "spname"
    t.integer  "spcompany",  limit: 255
    t.integer  "spcomm"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parentcomm"
  end

  create_table "salestransactions", force: true do |t|
    t.datetime "sdate",           limit: 255
    t.string   "table37id"
    t.integer  "salesid",         limit: 255
    t.integer  "salesamount"
    t.integer  "salescommission"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "relationship"
    t.integer  "parentcompany",   limit: 255
    t.datetime "commsdate",       limit: 255
  end

  create_table "states", force: true do |t|
    t.string   "statename"
    t.string   "countryname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
