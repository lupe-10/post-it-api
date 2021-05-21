class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :created_at, :category_id
  has_many :categories
end
