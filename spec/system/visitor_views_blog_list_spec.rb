require "rails_helper"

RSpec.describe "Visitor views blog list", type: :system do
  context "by visiting an individual category page" do
    it "shows a list of posts for that category" do
      category = create(:category)
      first_post = create(:post_with_categories_and_tags, categories: [category])
      second_post = create(:post_with_categories_and_tags, categories: [category])

      visit category_path(category)

      expect(page).to have_content I18n.t(
        "categories.show.page_description",
        name: category.name
      )

      expect(page).to have_content first_post.article.content
      expect(page).to have_content second_post.article.content
    end
  end
end
