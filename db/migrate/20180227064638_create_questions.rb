class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.jsonb :answers
      t.string :category

      t.timestamps
    end
  end
end
