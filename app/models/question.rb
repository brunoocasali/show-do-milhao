class Question < ActiveRecord::Base
  has_and_belongs_to_many :answers
  belongs_to :correct_answer, :foreign_key => 'correct_answer_id', :class_name => 'Answer'
  belongs_to :subject

  # validates_associated :answers, if: :has_more_space?
  #
  # private
  # def has_more_space?
  #   if answers.size > 3
  #     true
  #   else
  #     errors.add(:answers, 'Você é PROIBIDO de inserir mais de 3 respostas para essa questão!')
  #     false
  #   end
  # end
end