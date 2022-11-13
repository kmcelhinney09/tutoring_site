class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :building, :capacity
  belongs_to :school
  has_many :tutoring_time_slots

  def building
    building_name = Building.find(object.building_id).name
  end

end
