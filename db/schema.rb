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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_015758) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nationality"
    t.date "birth_date"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.date "published_date"
    t.string "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "published_at"
    t.integer "publisher_id", null: false
    t.integer "author_id", null: false
    t.string "genre"
    t.string "isbn"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "books_genres", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "publishers"
end
