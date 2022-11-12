class OnlineResource < ApplicationRecord
  belongs_to :school
  belongs_to :subject
  has_many :tag_links
  has_many :tags, through: :tag_links
end
