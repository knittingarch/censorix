class Category < ApplicationRecord
  validates :name, presence: true

  belongs_to :post, required: false
end
