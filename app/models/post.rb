class Post < ApplicationRecord
  validates :published_at, :title, presence: true
end
