FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end

  factory :post do
    content { "Let your imagination be your guide. Clouds are free they come and go as they please. Isn't that fantastic? You can just push a little tree out of your brush like that. Look around, look at what we have. Beauty is everywhere, you only have to look to see it. Isn't it fantastic that you can change your mind and create all these happy things?" }
    image_url { "www.someimage.com" }
    published_at { 1.month.ago }
    sequence(:title) { |n| "Blog Content ##{n}" }

    factory :post_with_categories_and_tags do
      transient do
        categories_count { 2 }
        tags_count { 3 }
      end

      categories do
        Array.new(categories_count) do
          association(:category, posts: [instance])
        end
      end

      tags do
        Array.new(tags_count) do
          association(:tag, posts: [instance])
        end
      end
    end
  end

  factory :tag do
    sequence(:name) { |n| "tag#{n}" }
  end

  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    password { "test123" }
  end
end
