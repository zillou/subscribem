require 'rails_helper'

feature 'Account signs up' do
  scenario 'successfully' do
    visit subscribem.root_path

    click_on 'Account Sign Up'
    fill_in 'Name', with: 'Test'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'

    expect(page).to have_content 'Signed in as user@example.com'
  end
end
