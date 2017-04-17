class CreatePlayedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :played_games do |t|
      t.references :game
      t.references :player

      t.timestamps
    end
  end
end
