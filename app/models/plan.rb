class Plan < ApplicationRecord
  belongs_to :user, class_name: "User"

  validates_uniqueness_of :month, scope: [:year, :plan_type, :user_id]
  str_enum :plan_type ,[:estimation, :actual]
end
