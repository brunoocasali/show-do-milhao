class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy, autosave: true
  belongs_to :subject

  accepts_nested_attributes_for :answers

  scope :has_selectable, -> { group('id').order('RAND()') }

  def correct_answer
    answers.where(is_correct: true).first
  end
end