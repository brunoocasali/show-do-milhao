class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.references :correct_answer, index: true
      t.references :subject, index: true

      t.timestamps
    end
  end
end
