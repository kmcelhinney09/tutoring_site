class SubjectSerializer < ActiveModel::Serializer
  has_many :online_resoureces
  attributes :id, :name
end
