class AddFieldsToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :body, :text
    add_column :answers, :correct, :boolean
    add_reference :answers, :question, foreign_key: true
  end
end