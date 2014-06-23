require "rails_helper"

feature "Account" do
  scenario "creating an account" do
    visit subscribem.root_path
    click_link "Account Sign Up"

    fill_in "Name", with: "Test"
    fill_in "Subdomain", with: "test"
    fill_in "Email", with: "subscribem@example.com"
    fill_in "Password", with: "password", exact: true
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(current_url).to eq "http://test.example.com/subscribem/"
    expect(page).to have_content "Signed in as subscribem@example.com"
  end

  scenario "ensure subdomain uniqueness" do
    Subscribem::Account.create!(subdomain: "test", name: "Test")

    visit subscribem.root_path
    click_link "Account Sign Up"

    fill_in "Name", with: "Test"
    fill_in "Subdomain", with: "test"
    fill_in "Email", with: "subscribem@example.com"
    fill_in "Password", with: "password", exact: true
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(current_url).to eq "http://www.example.com/subscribem/accounts"
    expect(page).to have_content "Sorry, your account could not be created."
    expect(page).to have_content "Subdomain has already been taken"
  end

  scenario "subdomain with restricted name" do
    visit subscribem.root_path
    click_link "Account Sign Up"

    fill_in "Name", with: "Test"
    fill_in "Subdomain", with: "admin"
    fill_in "Email", with: "subscribem@example.com"
    fill_in "Password", with: "password", exact: true
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(current_url).to eq "http://www.example.com/subscribem/accounts"
    expect(page).to have_content "Sorry, your account could not be created."
    expect(page).to have_content "Subdomain is not allowed. Please choose another subdomain."
  end

  scenario "subdomain with invalid name" do
    visit subscribem.root_path
    click_link "Account Sign Up"

    fill_in "Name", with: "Test"
    fill_in "Subdomain", with: "<admin>"
    fill_in "Email", with: "subscribem@example.com"
    fill_in "Password", with: "password", exact: true
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(current_url).to eq "http://www.example.com/subscribem/accounts"
    expect(page).to have_content "Sorry, your account could not be created."
    expect(page).to have_content "Subdomain is not allowed. Please choose another subdomain."
  end
end
