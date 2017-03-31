class CreatePlays < ActiveRecord::Migration[5.0]
  def change
    create_table :plays do |t|
      t.integer :points
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end