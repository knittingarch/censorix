FactoryBot.define do
  factory :article do
    association(:post)

    content { "This is an article for a blog post!" }
  end

  factory :category do
    sequence(:name) { |n| "Category #{n}" }

    trait :post_with_categories do
      transient do
        categories_count { 1 }
      end

      after(:create) do |post, evaluator|
        create_list(:category, evaluator.categories_count, posts: [post])
        post.reload
      end
    end
  end

  factory :post do
    image_url { "www.someimage.com" }
    published_at { 1.month.from_now }
    sequence(:title) { |n| "Blog Content ##{n}" }

    factory :post_with_categories do
      transient do
        categories_count { 1 }
      end

      after(:create) do |post, evaluator|
        create_list(:category, evaluator.categories_count, posts: [post])
        post.reload
      end
    end
  end

  factory :tag do
    sequence(:name) { |n| "tag#{n}" }

    trait :post_with_tags do
      transient do
        tags_count { 3 }
      end

      after(:create) do |profile, evaluator|
        create_list(:tag, evaluator.tags_count, posts: [post])
        profile.reload
      end
    end
  end
end
