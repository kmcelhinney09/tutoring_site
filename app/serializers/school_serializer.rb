class SchoolSerializer < ActiveModel::Serializer
  attributes :school_name, :locations
  has_many :tutoring_time_slots

  def locations
    set_locations =  object.locations
    buildings =[]
    school_locations = Hash.new
    set_locations.each do |loc|
      if buildings.exclude?(loc.building_id)
        buildings.push(loc.building_id)
        school_locations[loc.building.name] = [loc]
      else
        loc_array = school_locations[loc.building.name]
        loc_array.push(loc)
        school_locations[loc.building.name]= loc_array;
      end
    end
    school_locations.to_a
  end
end
