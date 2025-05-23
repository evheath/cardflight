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

ActiveRecord::Schema[8.0].define(version: 2025_05_12_192750) do
  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "primary_address"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", primary_key: "transaction_id", id: :string, force: :cascade do |t|
    t.string "raw_message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "merchant"
    t.string "network"
    t.integer "amount"
    t.string "transaction_descriptor"
    t.string "auth_code"
    t.index ["transaction_id"], name: "index_transactions_on_transaction_id", unique: true
  end

  add_foreign_key "addresses", "customers"
end
