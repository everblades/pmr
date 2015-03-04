class Page < ActiveRecord::Base
  validates_presence_of :title, :body

  extend FriendlyId
  friendly_id :title, use: :slugged
end
