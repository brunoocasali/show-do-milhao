class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :correct_answer, index: true
      t.references :subject, index: true
      t.text :description

      t.timestamps
    end

    create_table :answers do |t|

      t.belongs_to :question, index: true
      t.string :title

      t.timestamps
    end
  end
end
