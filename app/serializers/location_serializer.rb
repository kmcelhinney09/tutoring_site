class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :building, :capacity
end
