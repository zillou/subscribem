require 'rails_helper'

feature 'Account signs up' do
  scenario 'successfully' do
    visit subscribem.root_path

    click_on 'Account Sign Up'
    fill_in 'Name', with: 'Test'
    click_on 'Create Account'

    expect(page).to have_content 'Your account has been successfully created.'
  end
end
