class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, index: true
      t.string :title, limit: 400
      t.boolean :is_correct, default: false

      t.timestamps
    end
  end
end
