require 'rails_helper'

describe Tag do
  it { should belong_to :image }
  it { should validate_presence_of :image_id }
  it { should validate_presence_of :title }
end
