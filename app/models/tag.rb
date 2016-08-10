class Tag < ActiveRecord::Base
  has_many :question_tags

  validates :name, presence: true
end
