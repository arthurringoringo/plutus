class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :month
      t.integer :year
      t.string :type

      t.timestamps
    end
  end
end
