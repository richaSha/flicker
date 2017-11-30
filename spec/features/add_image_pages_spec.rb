require 'rails_helper'

describe Image do

  it 'uploads a selected image' do
    visit root_path
    click_link 'Sign up'
    fill_in "email", with: "test@test.com"
    fill_in "username", with: "test"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"
    click_button 'Sign Up'
    click_link 'Upload Image'
    fill_in 'name', with: 'Mt Hood at Sunrise'
    page.attach_file("photo", 'spec/features/images/images1.jpeg')
    click_button 'Upload Image'
    expect(page).to have_content 'Mt Hood at Sunrise'
  end
end
