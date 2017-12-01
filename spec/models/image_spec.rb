require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should have_many :tags }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }
  it 'should show image' do
    image = FactoryBot.create(:image)
    image.name.should eq "test"
  end

  it 'should show image' do
    image = FactoryBot.create(:image, :name => "new test")
    image.name.should eq "new test"
  end

  it 'should show username of image uploader' do
    image = FactoryBot.create(:image)
    user = User.find(image.user_id)
    user.username.should eq "Richa"
  end

  it 'should show email_address of image uploader' do
    image = FactoryBot.create(:image)
    user = User.find(image.user_id)
    user.email_address.should eq "richa.shaurabh@gmail.com"
  end

  it 'should show email_address of image uploader' do
    image = FactoryBot.create(:image)
    user = User.find(image.user_id)
    user.images[0].name.should eq "test"
  end

end
