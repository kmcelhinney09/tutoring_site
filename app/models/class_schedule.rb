class ClassSchedule < ApplicationRecord
 belongs_to :subject
 belongs_to :class_period
 belongs_to :student, class_name:"User"
 belongs_to :teacher, class_name:"User"
end
