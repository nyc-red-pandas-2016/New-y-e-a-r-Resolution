class QuestionTag < ActiveRecord::Base
  belongs_to :question, :tag
end
