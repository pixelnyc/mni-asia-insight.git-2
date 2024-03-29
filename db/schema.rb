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

ActiveRecord::Schema.define(version: 20150716205130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "sign_in_count",      default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", unique: true, using: :btree

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.text     "bio"
  end

  create_table "authors_posts", force: true do |t|
    t.integer  "post_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors_posts", ["author_id"], name: "index_authors_posts_on_author_id", using: :btree
  add_index "authors_posts", ["post_id"], name: "index_authors_posts_on_post_id", using: :btree

  create_table "blog_posts", force: true do |t|
    t.string   "cover"
    t.string   "headline"
    t.text     "readout"
    t.text     "content"
    t.string   "slug"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "central_banks", force: true do |t|
    t.string   "bank_name"
    t.string   "bank_link"
    t.string   "policy_target"
    t.string   "current_settings"
    t.string   "change"
    t.string   "next_policy_announcement"
    t.string   "report_name"
    t.string   "report_link"
    t.string   "change_expected"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_ticker",                default: false
    t.date     "changed_at"
  end

  create_table "charts", force: true do |t|
    t.string   "image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "data_for"
    t.integer  "country_id"
    t.date     "date"
    t.time     "time_local"
    t.time     "time_gmt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_ticker",  default: false
  end

  add_index "events", ["country_id"], name: "index_events_on_country_id", using: :btree

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "links", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "in_ticker",    default: false
    t.datetime "published_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "code"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "post_countries", force: true do |t|
    t.integer "post_id"
    t.integer "country_id"
  end

  create_table "post_sections", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "cover"
    t.integer  "parent_id"
    t.boolean  "in_menu",     default: true
    t.text     "description"
  end

  add_index "post_sections", ["code"], name: "index_post_sections_on_code", using: :btree
  add_index "post_sections", ["parent_id"], name: "index_post_sections_on_parent_id", using: :btree

  create_table "post_sections_posts", force: true do |t|
    t.integer  "post_id"
    t.integer  "post_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_sections_posts", ["post_id"], name: "index_post_sections_posts_on_post_id", using: :btree
  add_index "post_sections_posts", ["post_section_id"], name: "index_post_sections_posts_on_post_section_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "cover"
    t.string   "slug"
    t.string   "headline"
    t.text     "byline"
    t.text     "content"
    t.boolean  "authors_pick",      default: false
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "featured_level"
    t.boolean  "in_digest",         default: false
    t.boolean  "is_breaking_news",  default: true
    t.boolean  "top_lede",          default: false
    t.text     "cover_description"
    t.string   "video_mp4"
    t.string   "video_webm"
    t.datetime "published_at"
    t.string   "cover_credits"
    t.integer  "rank"
    t.integer  "rank_position"
    t.integer  "views",             default: 0
    t.string   "seo_title"
    t.string   "seo_keywords"
    t.text     "seo_description"
    t.boolean  "in_ticker",         default: false
    t.boolean  "in_carousel",       default: false
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", using: :btree

  create_table "seed_migration_data_migrations", force: true do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "site_settings", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "company"
    t.string   "phone_number"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
