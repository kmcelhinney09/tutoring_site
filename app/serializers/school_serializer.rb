class SchoolSerializer < ActiveModel::Serializer
  attributes :school_name
  has_many :locations
end
