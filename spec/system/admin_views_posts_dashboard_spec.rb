require "rails_helper"

RSpec.describe "Admin views posts dasboard", type: :system do
  # context "by clicking on sidebar link" do
  #   it "shows the pertinent post data" do
  #     category = create(:category, name: "Flowers")
  #     tag = create(:tag, name: "gardening")
  #     create(:post,
  #       title: "Roses are red!",
  #       categories: [category],
  #       tags: [tag])

  #     visit "/admin/posts"

  #     expect(page).to have_content "Roses are red!"
  #     expect(page).to have_content "Flowers"
  #     expect(page).to have_content "gardening"
  #   end
  # end

  context "by clicking 'New post'" do
    it "leads to a page where a new post can be created" do
      create(:category, name: "Cooking")
      create(:tag, name: "dinner")

      visit "/admin/posts/new"
      fill_in "Title", with: "This is a new post title!"
      select "Cooking", from: "Categories"
      check "Featured"
      select "dinner", from: "Tags"
      fill_in "Content", with: "This is the content for my new post!"
      click_button "Create Post"

      expect(page).to have_content "Post was successfully created."
      expect(page).to have_content "This is a new post title!"
      expect(page).to have_content "Cooking"
      expect(page).to have_content "This is the content for my new post!"
      expect(page).to have_content "dinner"
    end
  end
end
