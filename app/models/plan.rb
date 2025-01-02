class Plan < ApplicationRecord
  belongs_to :user, class_name: "User"

  str_enum :plan_type ,[:estimation, :actual]
end
