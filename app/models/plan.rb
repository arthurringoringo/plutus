class Plan < ApplicationRecord
  belongs_to :user, class_name: "User"

  has_many :incomes
  has_many :expenses

  validates_uniqueness_of :month, scope: [:year, :plan_type, :user_id]
  str_enum :plan_type ,[:estimation, :actual]

  def total_incomes
    incomes.pluck(:amount).sum
  end

  def total_expense
    expenses.pluck(:amount).sum
  end

  def total_debt_expense
    expenses.where(is_debt_payment: true).pluck(:amount).sum
  end

  def total_non_debt_expense
    expenses.where(is_debt_payment: [nil,false]).pluck(:amount).sum
  end
end
