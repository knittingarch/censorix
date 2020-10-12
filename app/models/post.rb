class Post < ApplicationRecord
  validates :title, presence: true

  has_and_belongs_to_many :tags
  has_many :categories
  has_one :article
end
