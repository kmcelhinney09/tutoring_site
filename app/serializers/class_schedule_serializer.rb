class ClassScheduleSerializer < ActiveModel::Serializer
  attributes :id, :end_time, :start_time, :class_period, :subject_name, :teacher
  belongs_to :subject

  def subject_name
    object.subject.name
  end
  def class_period
    object.class_period.number
  end
  def teacher
    object.teacher.full_name
  end
  def start_time
    start_time = object.class_period.start_time.strftime(" %l %M %p")
  end

  def end_time
    end_time = object.class_period.end_time.strftime(" %l %M %p")
  end
end
