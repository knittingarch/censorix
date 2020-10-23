class Post < ApplicationRecord
  validates :title, presence: true

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags
  has_one :article
end
