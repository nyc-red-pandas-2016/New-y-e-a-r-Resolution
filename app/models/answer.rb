class Answer < ActiveRecord::Base
  include VoteCount
  include TimeSince

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :text, presence: true
end
