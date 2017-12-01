require 'rails_helper'

describe User do

  it 'user signin with correct credentials' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in "email_address", with: "richa.shaurabh@gmail.com"
    fill_in "password", with: "richa123"
    click_button 'Sign in'
    expect(page).to have_content "You've signed in."
  end

  it 'user signin with incorrect credentials' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in "email_address", with: "richa.shaurabh@gmail.com"
    fill_in "password", with: "654321"
    click_button 'Sign in'
    expect(page).to have_content "There was a problem signing in. Please try again."
  end

  it 'redirect to home page if user is available' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in "email_address", with: "richa.shaurabh@gmail.com"
    fill_in "password", with: "richa123"
    click_button 'Sign in'
    visit '/signin'
    expect(page).to have_content "Welcome!"
  end

end
