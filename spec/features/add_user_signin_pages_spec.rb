require 'rails_helper'

describe User do

  it 'user signin with correct credentials' do
    visit root_path
    click_link 'Sign up'
    fill_in "email", with: "test@test.com"
    fill_in "username", with: "test"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"
    click_button 'Sign Up'
    click_link 'Sign Out'
    click_link 'Sign in'
    fill_in "email_address", with: "test@test.com"
    fill_in "password", with: "123456"
    click_button 'Sign in'
    expect(page).to have_content "You've signed in."
  end

  it 'user signin with incorrect credentials' do
    visit root_path
    click_link 'Sign up'
    fill_in "email", with: "test@test.com"
    fill_in "username", with: "test"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"
    click_button 'Sign Up'
    click_link 'Sign Out'
    click_link 'Sign in'
    fill_in "email_address", with: "test@test.com"
    fill_in "password", with: "654321"
    click_button 'Sign in'
    expect(page).to have_content "There was a problem signing in. Please try again."
  end
end
