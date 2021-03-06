class Post < ApplicationRecord
  validates :content, :title, presence: true

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  def self.most_recent_featured_post
    order("updated_at").where(featured: true).last
  end
end
