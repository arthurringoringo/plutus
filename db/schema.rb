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

ActiveRecord::Schema[7.0].define(version: 2025_01_03_055450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.float "amount"
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.boolean "is_debt_payment", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_expenses_on_plan_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.float "amount"
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["plan_id"], name: "index_incomes_on_plan_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "month"
    t.integer "year"
    t.string "plan_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "debt_percentage"
    t.float "save_percentage"
    t.float "expense_percentage"
  end

  add_foreign_key "expenses", "plans"
  add_foreign_key "expenses", "users"
  add_foreign_key "incomes", "plans"
  add_foreign_key "incomes", "users"
  add_foreign_key "plans", "users"
end
