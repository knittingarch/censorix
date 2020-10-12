FactoryBot.define do
  sequence(:name) { |n| "Category #{n}" }
  sequence(:title) { |n| "Blog ##{n}" }

  factory :article do
    association(:post)

    content { "This is an article for a blog post!" }
  end

  factory :category do
    association(:post)

    name
  end

  factory :post do
    image_url { "www.someimage.com" }
    published_at { 1.month.from_now }
    title
  end


end
