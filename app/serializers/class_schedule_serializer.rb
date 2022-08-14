class ClassScheduleSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :class_period_id, :subject_id, :teacher_id
end
