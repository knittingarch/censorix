FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end

  factory :post do
    content { "This is an article for a blog post!" }
    image_url { "www.someimage.com" }
    published_at { 1.month.from_now }
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
end
