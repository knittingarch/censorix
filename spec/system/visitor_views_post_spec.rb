require "rails_helper"

RSpec.describe "Visitor views posts", type: :system do
  context "by clicking on 'see full post' link on home" do
    it "shows the full post" do
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

  context "by viewing post on category show page" do
    it "shows truncated post" do
      category = create(:category)
      content = "It's important to me that you're happy. Maybe we got a few little happy bushes here, just covered with snow. It's all a game of angles. Anytime you learn something your time and energy are not wasted. You can do anything your heart can imagine. Do an almighty painting with us. We tell people sometimes: we're like drug dealers, come into town and get everybody absolutely addicted to painting. It doesn't take much to get you addicted. I guess that would be considered a UFO. A big cotton ball in the sky. Automatically, all of these beautiful, beautiful things will happen."
      article = create(:article, content: content)
      tag = create(:tag)

      post = create(:post,
        categories: [category],
        article: article,
        tags: [tag])

      visit category_path(category)

      expect(page).to have_content post.title
      expect(page).to have_content post.published_at
      expect(page).to have_content(post.article.content.truncate(200))
      expect(page).not_to have_content(post.tags.first.name)
    end
  end
end
