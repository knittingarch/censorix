require "rails_helper"

RSpec.describe "Visitor views featured post on home page", type: :system do
  context "by going to the home page" do
    it "shows featured post" do
      regular_post = create(:post)
      featured_post = create(:post, featured: true)

      visit root_path

      expect(page).to have_content featured_post.title
      expect(page).to have_content I18n.t("posts.featured.label")
      expect(page).not_to have_content regular_post.title
    end
  end
end
