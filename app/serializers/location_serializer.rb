class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :building, :capacity
  belongs_to :school
  has_many :tutoring_time_slot
end
