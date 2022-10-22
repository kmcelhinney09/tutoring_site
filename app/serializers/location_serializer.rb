class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :building, :capacity
  belongs_to :school
  belongs_to :tutoring_time_slot
end
