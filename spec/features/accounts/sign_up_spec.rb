require "rails_helper"

feature "Account" do
  scenario "creating an account" do
    visit subscribem.root_path
    click_link "Account Sign Up"

    fill_in "Name", with: "test"
    fill_in "Email", with: "subscribem@example.com"
    fill_in "Password", with: "password", exact: true
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"
    expect(page).to have_content "Signed in as subscribem@example.com"
  end
end
