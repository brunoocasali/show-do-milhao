class DeleteCorrectAnswerIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :correct_answer_id
  end
end
