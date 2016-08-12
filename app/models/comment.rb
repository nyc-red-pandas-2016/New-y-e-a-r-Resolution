class Comment < ActiveRecord::Base
  include TimeSince

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :text, presence: true
end
