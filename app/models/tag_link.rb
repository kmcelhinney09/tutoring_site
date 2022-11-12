class TagLink < ApplicationRecord
  belongs_to :tag
  belongs_to :online_resource
end
