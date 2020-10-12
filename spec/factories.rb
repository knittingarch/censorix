FactoryBot.define do
  sequence(:title) { |n| "Blog ##{n}" }

  factory :article do
    association(:post)

    content { "This is an article for a blog post!" }
  end

  factory :post do
    image_url { "www.someimage.com" }
    published_at { 1.month.from_now }
    title
  end
end
