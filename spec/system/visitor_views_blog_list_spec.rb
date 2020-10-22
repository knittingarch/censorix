require "rails_helper"

RSpec.describe "Visitor views blog list", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  context "by going to the category list page" do
    it "shows list of categories" do
      category = create(:category)

      visit root_path
      click_on I18n.t("categories.index.heading")

      expect(page).to have_content I18n.t("categories.index.page_description")
      expect(page).to have_content category.name
    end
  end

  context "by visiting an individual category page" do
    it "shows a list of posts" do
      category = create(:category)
      article1 = create(:article)
      article2 = create(:article)
      tag1 = create(:tag)
      tag2 = create(:tag)
      tag3 = create(:tag)

      post1 = create(:post,
        categories: [category],
        article: article1,
        tags: [tag1])

      post2 = create(:post,
        categories: [category],
        article: article2,
        tags: [tag2, tag3])

      visit categories_path
      click_on category.name

      expect(page).to have_content I18n.t(
        "categories.show.page_description",
        name: category.name
      )
      expect(page).to have_content post1.article.content
      expect(page).to have_content post1.tags.first.name
      expect(page).to have_content post2.article.content
      expect(page).to have_content post2.tags.first.name
      expect(page).to have_content post2.tags.last.name
    end
  end
end
