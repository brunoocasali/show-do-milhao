class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :correct_answer, :foreign_key => 'correct_answer_id', :class_name => 'Answer'
  belongs_to :subject
end
