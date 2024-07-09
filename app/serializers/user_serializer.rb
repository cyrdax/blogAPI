class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :picture, :bio, :created_at, :updated_at

  has_many :posts

  def posts
    object.posts.map do |post|
      PostSerializer.new(post, scope: scope, root: false)
    end
  end
end
