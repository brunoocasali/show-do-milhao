class Question < ActiveRecord::Base
  belongs_to :correct_answer
  belongs_to :answer
  belongs_to :subject
end
