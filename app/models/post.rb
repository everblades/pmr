class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :excerpt
  belongs_to :user
  has_attached_file :photo, styles: {:medium => "300x300>", :thumb => "100x100#"}
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: :slugged
end
