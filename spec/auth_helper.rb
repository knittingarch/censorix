def login_user(user)
  visit "/login"

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on I18n.t("auth.login")
end
