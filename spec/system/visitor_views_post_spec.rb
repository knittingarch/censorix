require "rails_helper"

RSpec.describe "Visitor views full posts", type: :system do
  context "by clicking on 'see full post' link on home page" do
    it "shows the full featured post" do
      post = create(:post_with_categories_and_tags, featured: true)

      visit root_path

      click_on I18n.t("posts.featured.cta")

      expect(page).to have_content post.title
      expect(page).to have_content post.published_at
      expect(page).to have_content I18n.t("posts.featured.label")
      expect(page).to have_content post.tags.first.name
      expect(page).to have_content post.content
    end
  end

  context "by viewing post on category show page" do
    it "shows truncated post" do
      category = create(:category)
      content = "It's important to me that you're happy. Maybe we got a few little happy bushes here, just covered with snow. It's all a game of angles. Anytime you learn something your time and energy are not wasted. You can do anything your heart can imagine. Do an almighty painting with us. We tell people sometimes: we're like drug dealers, come into town and get everybody absolutely addicted to painting. It doesn't take much to get you addicted. I guess that would be considered a UFO. A big cotton ball in the sky. Automatically, all of these beautiful, beautiful things will happen."

      post = create(:post_with_categories_and_tags, content: content, categories: [category])

      visit category_path(category)

      expect(page).to have_content post.title
      expect(page).to have_content post.published_at
      expect(page).to have_content(post.content.truncate(200, separator: " ") { link_to t("posts.truncated.keep_reading"), post_path(post) })
      expect(page).not_to have_content(post.tags.first.name)
      expect(page).not_to have_content(post.content)
    end
  end
end
