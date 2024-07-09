class LinkSerializer < ActiveModel::Serializer
  attributes :id, :link_name, :link_url, :picture, :created_at, :updated_at
end
