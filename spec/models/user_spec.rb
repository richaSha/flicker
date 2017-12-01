require 'rails_helper'

describe User do
  it { should validate_presence_of :username }
  it { should validate_presence_of :email_address }
  it { should validate_uniqueness_of :email_address }
  it { should have_many :images }
  it 'should show new name' do
    user = FactoryBot.create(:user, :username => "Dan")
    user.username.should eq "Dan"
  end

  it 'should show name' do
    user = FactoryBot.create(:user)
    user.username.should eq "Richa"
  end

  it 'should show email' do
    user = FactoryBot.create(:user)
    user.email_address.should eq "richa.shaurabh@gmail.com"
  end

  it 'should show new email' do
    user = FactoryBot.create(:user, :email_address => "test@test.com")
    user.email_address.should eq "test@test.com"
  end

  it 'should show user images array' do
    user = FactoryBot.create(:user, :email_address => "test@test.com")
    user.images.should eq []
  end
  
end
