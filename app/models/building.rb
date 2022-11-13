class Building < ApplicationRecord
  belongs_to :school
  has_one :location
end
