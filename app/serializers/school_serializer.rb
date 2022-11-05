class SchoolSerializer < ActiveModel::Serializer
  attributes :school_name
  has_many :locations
  has_many :tutoring_time_slots
end
