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

  it 'uploads a selected image' do
    user = FactoryBot.create(:image)
    visit root_path
    click_link 'Sign in'
    fill_in "email_address", with: "richa.shaurabh@gmail.com"
    fill_in "password", with: "richa123"
    click_button 'Sign in'
    expect(page).to have_content "test"
  end

  it 'uploads a selected image without title' do
    visit root_path
    click_link 'Sign up'
    fill_in "email", with: "test@test.com"
    fill_in "username", with: "test"
    fill_in "password", with: "123456"
    fill_in "password_confirmation", with: "123456"
    click_button 'Sign Up'
    click_link 'Upload Image'
    page.attach_file("photo", 'spec/features/images/images1.jpeg')
    click_button 'Upload Image'
    expect(page).to have_content 'There was a problem uploading image'
  end

  it 'deletes selected image' do
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
    click_link 'Delete'
    expect(page).to have_content "Image successfully deleted!"
  end

  it 'updating selected image' do
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
    click_link 'Edit'
    fill_in 'name', with: 'Mt Hood'
    click_button 'Edit Image'
    expect(page).to have_content "Image successfully updated!"
  end

  it 'updating selected image without any content' do
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
    click_link 'Edit'
    fill_in 'name', with: ''
    click_button 'Edit Image'
    expect(page).to have_content "Something went wrong.. Please try again..."
  end

end
