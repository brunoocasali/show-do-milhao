class CreateAnswersQuestions < ActiveRecord::Migration
  def change
    create_table :answers_questions, id: false do |t|
      t.belongs_to :question
      t.belongs_to :answer
    end
  end
end
