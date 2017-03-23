class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|

      t.timestamps
    end
  end
  
  def change
    add_column :quizzes, :title, :string
    add_reference :quizzes, :category, foreign_key: true
  end
  
end
