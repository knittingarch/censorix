require "rails_helper"

RSpec.describe "Admin views posts dasboard", type: :system do
  context "by clicking on sidebar link" do
    it "shows the pertinent post data" do
      category = create(:category, name: "Flowers")
      tag = create(:tag, name: "gardening")
      create(:post,
        title: "Roses are red!",
        categories: [category],
        tags: [tag])

      visit "/admin/posts"

      expect(page).to have_content "Roses are red!"
      expect(page).to have_content "Flowers"
      expect(page).to have_content "gardening"
    end
  end
end
