class Question < ActiveRecord::Base
  belongs_to :user
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :body, presence: true

  def add_view
    self.views += 1
    self.save
  end
end
