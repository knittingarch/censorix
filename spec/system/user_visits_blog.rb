require "rails_helper"
require "auth_helper"

RSpec.describe "User visits blog", type: :system do
  context "by creating an account" do
    it "shows a created state" do
      visit new_user_path

      fill_in "Email", with: "test1@test.com"
      fill_in "Password", with: "test123"
      click_on I18n.t("auth.create")

      expect(page).to have_content I18n.t("auth.account_created")
    end
  end

  context "by logging into their account" do
    it "shows a logged in state" do
      user = create(:user)

      login_user(user)

      expect(page).to have_content I18n.t("auth.successful_login")
    end
  end

  context "by logging out of their account" do
    it "shows a logged out state" do
      user = create(:user)

      login_user(user)

      click_on I18n.t("auth.logout")

      expect(page).to have_content I18n.t("auth.logged_out")
    end
  end
end
