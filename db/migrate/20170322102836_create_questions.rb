class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :number
      t.reference :quiz, foreign_key: true
      t.timestamps
    end
  end
end