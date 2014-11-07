class Answer < ActiveRecord::Base
  belongs_to :subject
  has_and_belongs_to_many :questions

  validate :must_have_3_answers_or_less

  def must_have_3_answers_or_less
    if self.questions_answers.size > 3
      self.errors.add_to_base("Author is required to have 3 books or less")
    end
  end
end
