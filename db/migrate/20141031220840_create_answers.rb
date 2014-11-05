class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.references :answers, :question, index: true
      t.references :answers, :subject, index: true
      t.string :title

      t.timestamps
    end
  end
end
