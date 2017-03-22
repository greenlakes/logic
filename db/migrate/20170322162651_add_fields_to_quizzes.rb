class AddFieldsToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :title, :string
    add_column :quizzes, :category, :reference
  end
end
