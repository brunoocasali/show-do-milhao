class AlterLenghtFromTitleInAnwsers < ActiveRecord::Migration
  def change
    change_column :answers, :title, :string, limit: 400
  end
end
