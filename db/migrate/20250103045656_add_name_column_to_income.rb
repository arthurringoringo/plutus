class AddNameColumnToIncome < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :name, :string
  end
end
