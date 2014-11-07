class Answer < ActiveRecord::Base
  belongs_to :subject
  has_and_belongs_to_many :questions

  scope :allowed_answers, -> (correct_answer, subject){
    where(subject_id: subject).where.not(id: correct_answer).order('RAND()').limit(3)
  }
end
