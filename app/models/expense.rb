class Expense < ApplicationRecord
  belongs_to :plan
  belongs_to :user
end
