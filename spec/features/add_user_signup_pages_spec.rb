require 'rails_helper'

describe User do

  it 'user sign up with correct required fields' do
    visit root_path
    click_link 'Sign up'
    fill_in "email", with: "test@test.com"
    fill_in "username", with: "test"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"
    click_button 'Sign Up'
    expect(page).to have_content 'test'
  end

  it 'user sign up with incorrect password' do
    visit root_path
    click_link 'Sign up'
    fill_in "email", with: "test@test.com"
    fill_in "username", with: "test"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "654321"
    click_button 'Sign Up'
    expect(page).to have_content "There was a problem signing up."
  end
end
