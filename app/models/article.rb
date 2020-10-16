class Article < ApplicationRecord
  validates :content, presence: true

  belongs_to :post, required: false
end
