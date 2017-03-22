class AddFieldsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :body, :text
    add_column :questions, :number, :integer
    add_reference :questions, :quiz, foreign_key: true
  end
end
