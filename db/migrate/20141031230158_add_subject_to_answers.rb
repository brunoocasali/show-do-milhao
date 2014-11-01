class AddSubjectToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :subject, index: true
  end
end
