class DropAnswerIdFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :answers_id
  end
end
