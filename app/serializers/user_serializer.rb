class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :picture, :bio, :created_at, :updated_at

  has_many :posts
end
