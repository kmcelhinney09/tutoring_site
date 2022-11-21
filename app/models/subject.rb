class Subject < ApplicationRecord
  has_many :class_schedules
  has_many :online_resoureces
  has_many :tutored_subjects
end
