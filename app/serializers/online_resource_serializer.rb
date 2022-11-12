class OnlineResourceSerializer < ActiveModel::Serializer
  belongs_to :school
  belongs_to :subject
  attributes :id, :title, :url, :owner_id, :description, :subject_id, :tag
end
