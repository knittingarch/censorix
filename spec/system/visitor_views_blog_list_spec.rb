require "rails_helper"

RSpec.describe "Visitor views blog list", type: :system do
  context "by visiting an individual category page" do
    it "shows a list of posts for that category" do
      category = create(:category)
      article1 = create(:article)
      article2 = create(:article)

      post1 = create(:post,
        categories: [category],
        article: article1)

      post2 = create(:post,
        categories: [category],
        article: article2)

      visit category_path(category)

      expect(page).to have_content I18n.t(
        "categories.show.page_description",
        name: category.name
      )
      expect(page).to have_content post1.article.content
      expect(page).to have_content post2.article.content
    end
  end
end
