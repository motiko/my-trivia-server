class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :email
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
  end
end
