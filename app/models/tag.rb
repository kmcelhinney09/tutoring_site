class Tag < ApplicationRecord
  has_many :tag_links
  has_many :online_resoureces, through: :tag_links
end
