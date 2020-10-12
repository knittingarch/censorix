class Post < ApplicationRecord
  validates :published_at, :title, presence: true

  has_one :article
  has_many :categories
end
