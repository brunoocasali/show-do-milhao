class Question < ActiveRecord::Base
  has_and_belongs_to_many :answers
  belongs_to :correct_answer, :foreign_key => 'correct_answer_id', :class_name => 'Answer'
  belongs_to :subject
end