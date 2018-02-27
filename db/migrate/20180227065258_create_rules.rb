class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.string :name
      t.integer :questions_amount
      t.integer :seconds_per_question

      t.timestamps
    end
  end
end
