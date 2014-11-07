class CreateAnswersQuestions < ActiveRecord::Migration
  def change
    create_table :answers_questions, id: false do |t|
      t.belongs_to :question
      t.belongs_to :answer
    end

    add_index :answers_questions, [:question_id, :answer_id], :unique => true
  end
end
