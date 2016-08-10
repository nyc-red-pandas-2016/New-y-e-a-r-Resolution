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

  def time_since_asked
    start_time = self.create_at
    total_seconds = Time.now - start_time
    hours = (total_seconds/ 3600).to_i
    minutes = ((total_seconds % 3600) / 60).to_i
    seconds = ((total_seconds % 3600) % 60).to_i
  end


end
