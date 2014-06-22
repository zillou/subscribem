require "rails_helper"

feature "Account" do
  scenario "creating an account" do
    visit subscribem.root_path
    click_link "Account Sign Up"
    fill_in "Name", with: "test"
    click_button "Create Account"
    expect(page).to have_content "Your account has been successfully created."
  end
end
