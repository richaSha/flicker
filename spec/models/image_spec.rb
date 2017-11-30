require 'rails_helper'

describe Image do
  it { should belong_to :user }
  it { should have_many :tags }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }
  

end
