class AddFieldsToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :title, :string
    add_reference :quizzes, :category, foreign_key: true
  end
end
