class Post < ApplicationRecord
  validates :published_at, :title, presence: true

  has_one :article
  has_many :categories
  has_and_belongs_to_many :tags
end
