class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.references :player, index: true
      t.decimal :worth, precision: 10, scale: 2
      t.integer :jump, limit: 1, default: 3
      t.boolean :winner, default: false

      t.timestamps
    end
  end
end
