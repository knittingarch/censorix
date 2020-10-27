require "rails_helper"

RSpec.describe "Visitor views blog list", type: :system do
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

      post1 = create(:post,
        categories: [category],
        article: article1)

      post2 = create(:post,
        categories: [category],
        article: article2)

      visit categories_path
      click_on category.name

      expect(page).to have_content I18n.t(
        "categories.show.page_description",
        name: category.name
      )
      expect(page).to have_content post1.article.content
      expect(page).to have_content post2.article.content
    end
  end
end
