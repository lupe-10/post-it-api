class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :contents, presence: true, uniqueness: true

  scope :by_title, ->(title) { where title: title }
  scope :by_category, ->(category_ids) { joins(:categories).where(categories: { id: category_ids }) }
end
