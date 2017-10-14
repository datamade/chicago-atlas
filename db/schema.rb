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

ActiveRecord::Schema.define(:version => 20160822165221) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "datasets", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.string   "provider"
    t.string   "url"
    t.text     "metadata"
    t.integer  "category_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "data_type"
    t.string   "stat_type"
    t.boolean  "is_visible",  :default => true
  end

  add_index "datasets", ["category_id"], :name => "index_datasets_on_category_id"

  create_table "geographies", :force => true do |t|
    t.string   "geo_type"
    t.string   "name"
    t.string   "slug"
    t.text     "geometry"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "centroid"
    t.string   "adjacent_zips",            :default => "[]"
    t.string   "adjacent_community_areas", :default => "[]"
  end

  create_table "intervention_location_datasets", :force => true do |t|
    t.integer "intervention_location_id"
    t.integer "dataset_id"
  end

  add_index "intervention_location_datasets", ["intervention_location_id", "dataset_id"], :name => "index_intervention_location_dataset_idx"

  create_table "intervention_locations", :force => true do |t|
    t.string   "program_name"
    t.text     "hours",             :default => ""
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "dataset_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.text     "tags",              :default => ""
    t.string   "organization_name", :default => ""
    t.text     "categories",        :default => ""
    t.string   "purple_binder_url", :default => ""
    t.string   "program_url",       :default => ""
    t.integer  "community_area_id"
  end

  create_table "provider_stats", :force => true do |t|
    t.integer  "provider_id"
    t.string   "stat_type"
    t.string   "stat"
    t.float    "value"
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "data_type"
  end

  add_index "provider_stats", ["provider_id"], :name => "index_provider_stats_on_provider_id"
  add_index "provider_stats", ["stat_type"], :name => "index_provider_stats_on_stat_type"

  create_table "providers", :force => true do |t|
    t.integer  "src_id"
    t.string   "name"
    t.string   "slug"
    t.string   "primary_type"
    t.string   "sub_type"
    t.string   "addr_street"
    t.string   "addr_city"
    t.string   "addr_zip"
    t.string   "ownership_type"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "lat_long"
    t.text     "description"
    t.string   "phone"
    t.string   "url"
    t.string   "report_url"
    t.string   "report_name"
    t.text     "geometry"
    t.text     "areas"
    t.string   "area_type"
    t.text     "area_alt"
    t.string   "chna_url"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "doc_embed_url"
  end

  create_table "statistics", :force => true do |t|
    t.integer  "year"
    t.string   "name"
    t.float    "value"
    t.float    "lower_ci"
    t.float    "upper_ci"
    t.integer  "geography_id"
    t.integer  "dataset_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "year_range",   :default => ""
  end

  add_index "statistics", ["dataset_id"], :name => "index_statistics_on_dataset_id"
  add_index "statistics", ["geography_id"], :name => "index_statistics_on_geography_id"

end
