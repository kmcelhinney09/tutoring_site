class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :building, :capacity
  has_many :tutoring_time_slots
end
