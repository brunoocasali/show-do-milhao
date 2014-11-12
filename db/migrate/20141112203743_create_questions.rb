class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :correct_answer, index: true
      t.references :subject, index: true
      t.text :description

      t.timestamps
    end
  end
end
