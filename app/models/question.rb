class Question < ActiveRecord::Base
  has_many :answers, dependent: :delete_all
  belongs_to :correct_answer, :foreign_key => 'correct_answer_id', :class_name => 'Answer'
  belongs_to :subject

  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['title'].blank? }

  scope :has_correct_answer, -> { where.not(correct_answer_id: nil) }
  scope :has_selectable, -> { has_correct_answer.group('id').order('RAND()') }
end