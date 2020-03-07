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

ActiveRecord::Schema.define(version: 2020_03_05_190552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "user_id"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_answers_on_card_id"
    t.index ["user_id"], name: "index_card_answers_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.text "front"
    t.text "back"
    t.bigint "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["category_id"], name: "index_decks_on_category_id"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "favorite_categories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_favorite_categories_on_category_id"
    t.index ["user_id"], name: "index_favorite_categories_on_user_id"
  end

  create_table "favorite_decks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_favorite_decks_on_deck_id"
    t.index ["user_id"], name: "index_favorite_decks_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "review_value"
    t.text "content"
    t.bigint "user_id"
    t.bigint "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_reviews_on_deck_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_answers", "cards"
  add_foreign_key "card_answers", "users"
  add_foreign_key "cards", "decks"
  add_foreign_key "decks", "categories"
  add_foreign_key "decks", "users"
  add_foreign_key "favorite_categories", "categories"
  add_foreign_key "favorite_categories", "users"
  add_foreign_key "favorite_decks", "decks"
  add_foreign_key "favorite_decks", "users"
  add_foreign_key "reviews", "decks"
  add_foreign_key "reviews", "users"
end
