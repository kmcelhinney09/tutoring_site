class TeacherNote < ApplicationRecord
  belongs_to :teacher, class_name:"User"
  belongs_to :tutee, class_name:"User"
end
