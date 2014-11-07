class Question < ActiveRecord::Base
  has_and_belongs_to_many :answers
  belongs_to :correct_answer, :foreign_key => 'correct_answer_id', :class_name => 'Answer'
  belongs_to :subject


  validate :has_three_or_less_answers

  private
  def has_three_or_less_answers
    errors.add(:answers, 'Ei, você já adicionou 4 respostas para essa questão') if answers.size > 3
  end
end