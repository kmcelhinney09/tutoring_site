class OnlineResourceSerializer < ActiveModel::Serializer
  belongs_to :subject
  has_many :tags, through: :tag_links
  attributes :id, :title, :url, :owner_id, :description, :subject_id, :tags
end
