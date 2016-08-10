class Question < ActiveRecord::Base
  belong_to :user
  has_many :question_tags
  has_many :answers 
  has_many :comments, as: :commentable 
  has_many :votes, as: :votable

  validates :title, :body, presence: true
end
