require "rails_helper"

RSpec.describe "Visitor views featured post", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  context "by going to the home page" do
    it "shows featured post" do
      category = create(:category)
      article1 = create(:article)
      article2 = create(:article)
      tag1 = create(:tag)
      tag2 = create(:tag)
      tag3 = create(:tag)

      post1 = create(:post,
        categories: [category],
        article: article1,
        tags: [tag1],
        featured: true)

      post2 = create(:post,
        categories: [category],
        article: article2,
        tags: [tag2, tag3])

      visit root_path

      expect(page).to have_content post1.title
      expect(page).not_to have_content post2.title
    end

    it "shows most recent featured post" do
      category = create(:category)
      article1 = create(:article)
      article2 = create(:article)
      tag1 = create(:tag)
      tag2 = create(:tag)
      tag3 = create(:tag)

      post1 = create(:post,
        categories: [category],
        article: article1,
        tags: [tag1],
        featured: true,
        updated_at: 1.month.ago)

      post2 = create(:post,
        categories: [category],
        article: article2,
        tags: [tag2, tag3],
        featured: true)

      visit root_path

      expect(page).to have_content post2.title
      expect(page).not_to have_content post1.title
    end
  end
end
