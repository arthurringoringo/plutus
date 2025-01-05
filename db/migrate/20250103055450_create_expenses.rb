class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.references :plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.boolean :is_debt_payment, default: false

      t.timestamps
    end
  end
end
