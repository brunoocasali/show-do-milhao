class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :game, index: true
      t.references :question, index: true
      t.references :answer, index: true

      t.decimal :worth, precision: 10, scale: 2
      t.decimal :quit, precision: 10, scale: 2
      t.decimal :miss, precision: 10, scale: 2

      t.timestamps
    end
  end
end
