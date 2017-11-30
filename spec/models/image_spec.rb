require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should have_many :tags }
  it { should validate_presence_of :user_id }
  it 'uploads a selected image' do
    get '/'
    click_link 'Upload Image'
    fill_in 'Title', with: 'Mt Hood at Sunrise'
    page.attach_file("MtHood", 'spec/fixtures/images/mthoodsunset.jpg')
    click_button 'Upload Image'
    expect(page).to have_content 'Mt Hood at Sunrise'
  end
end
