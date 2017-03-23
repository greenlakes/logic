class CreateQuizzes < ActiveRecord::Migration [5.0]
    def change
        create_table :quizzes do |t|
        t.string :title
        t.boolean :published
        t.reference :category, foreign_key: true
        t.timestamps
        end
    end
end