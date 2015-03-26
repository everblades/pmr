class Page < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_length_of :description, :maximum => 160

  extend FriendlyId
  friendly_id :title, use: :slugged
end
