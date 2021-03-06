class DeviseCreatePlayers < ActiveRecord::Migration
  def change
    create_table(:players) do |t|
      t.string :name
      t.string :image
      t.string :email
      t.string :password

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :players, :email,                unique: true
  end
end
