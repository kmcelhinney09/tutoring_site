class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :school, :grade, :role, :password_digest
end
