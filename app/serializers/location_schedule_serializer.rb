class LocationScheduleSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :date_start_time, :date_end_time
end
