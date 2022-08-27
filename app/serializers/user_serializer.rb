class UserSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :school, :grade
end
