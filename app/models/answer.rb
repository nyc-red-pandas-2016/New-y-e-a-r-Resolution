class Answer < ActiveRecord::Base
  belongs_to :question, :user 
  has_many :comments, as: :commentable 
  has_many :votes, as: :votable

  validates :text, presence: true
end
