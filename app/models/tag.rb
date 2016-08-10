class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :tags

  validates :name, presence: true
end
