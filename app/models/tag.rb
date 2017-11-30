class Tag < ActiveRecord::Base
  belongs_to :image
  validates :image_id,:title, :presence => true

end
