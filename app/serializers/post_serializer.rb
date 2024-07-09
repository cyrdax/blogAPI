class PostSerializer < ActiveModel::Serializer
  attributes :id, :subject, :post_text, :picture, :created_at, :updated_at, :user_id, :user_name

  has_many :links

  def user_name
    object.user.name
  end
end
