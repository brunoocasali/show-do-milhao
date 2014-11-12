class Answer < ActiveRecord::Base
  belongs_to :subject
  belongs_to :question

  scope :allowed_answers, -> { order('RAND()') }
end
