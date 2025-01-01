class Plan < ApplicationRecord
  belongs_to :user, class_name: "User"

  str_enum :type ,[:estimation, :actual]
end
