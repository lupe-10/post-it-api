class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :created_at, :category_id
  belongs_to :category
end
