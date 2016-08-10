class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_secure_password

  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { minimum: 6 }

  
end
