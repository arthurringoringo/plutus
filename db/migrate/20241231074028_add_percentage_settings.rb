class AddPercentageSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :debt_percentage, :float
    add_column :users, :save_percentage, :float
    add_column :users, :expense_percentage, :float
  end
end
