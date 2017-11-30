class Image < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates :user_id, :presence => true

end
