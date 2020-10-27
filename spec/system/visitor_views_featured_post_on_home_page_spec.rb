require "rails_helper"

RSpec.describe "Visitor views featured post on home page", type: :system do
  context "by going to the home page" do
    it "shows featured post" do
      category = create(:category)
      article1 = create(:article)
      article2 = create(:article)
      tag1 = create(:tag)
      tag2 = create(:tag)
      tag3 = create(:tag)

      featured_post = create(:post,
        categories: [category],
        article: article1,
        tags: [tag1],
        featured: true)

      regular_post = create(:post,
        categories: [category],
        article: article2,
        tags: [tag2, tag3])

      visit root_path

      expect(page).to have_content featured_post.title
      expect(page).not_to have_content regular_post.title
    end
  end
end
