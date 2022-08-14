class OnlineResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :owner_id, :cubject_id, :tag
end
