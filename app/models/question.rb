class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy, autosave: true
  belongs_to :subject

  accepts_nested_attributes_for :answers

  scope :is_selectable, -> { includes(:answers).where(:answers => {:is_correct => true}).
      group('"questions"."id", "answers.id"').order('RANDOM()') }

  def correct_answer
    answers.where(is_correct: true).first
  end
end
