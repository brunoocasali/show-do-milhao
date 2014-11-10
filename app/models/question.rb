class Question < ActiveRecord::Base
  has_many :answers, dependent: :delete_all
  belongs_to :subject

  accepts_nested_attributes_for :answers

  scope :has_correct_answer, -> { where.not(correct_answer_id: nil) }
  scope :has_selectable, -> { has_correct_answer.group('id').order('RAND()') }

  def correct_answer
    answers.where(is_correct: true).first
  end
end