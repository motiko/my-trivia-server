class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.text :img_url
      t.string :name

      t.timestamps
    end
  end
end
