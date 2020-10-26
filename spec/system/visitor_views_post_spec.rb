require "rails_helper"

RSpec.describe "Visitor views featured post", type: :system do
  context "by clicking on 'see more' link" do
    it "shows the post" do
      category = create(:category)
      article = create(:article)
      tag = create(:tag)

      post = create(:post,
        categories: [category],
        article: article,
        tags: [tag],
        featured: true)

      visit root_path

      click_on I18n.t("posts.featured.cta")

      expect(page).to have_content post.title
      expect(page).to have_content post.published_at
      expect(page).to have_content post.tags.first.name
      expect(page).to have_content post.article.content
    end
  end
end
