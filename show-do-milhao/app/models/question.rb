class Question < ActiveRecord::Base
  has_one :correct_answer, :foreign_key => 'correct_answer_id', :class_name => 'Answer'
  has_many :answers
  belongs_to :subject
end
