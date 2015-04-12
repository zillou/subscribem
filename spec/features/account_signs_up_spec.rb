require 'rails_helper'

feature 'Account signs up' do
  scenario 'successfully' do
    visit subscribem.root_path

    click_on 'Account Sign Up'
    fill_in 'Name', with: 'Test'
    fill_in 'Subdomain', with: 'test'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'

    expect(current_url).to eq 'http://test.example.com/subscribem/'
    expect(page).to have_content 'Signed in as user@example.com'
  end

  scenario 'rejected by duplicated subdomain' do
    Subscribem::Account.create!(subdomain: 'test', name: 'test')
    visit subscribem.root_path

    click_on 'Account Sign Up'
    fill_in 'Name', with: 'Test'
    fill_in 'Subdomain', with: 'test'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'

    expect(current_url).to eq 'http://www.example.com/subscribem/accounts'
    expect(page).to have_content 'Sorry, your account could not be created.'
    expect(page).to have_content 'Subdomain has already been taken'
  end
end
