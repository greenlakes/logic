class PlaysController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end


  def check_results
    quiz = Quiz.find(params[:quiz][:id])
    count = 0
    questions_with_answers = params[:quiz][:questions]
    
    quiz.questions.map do |question|
      correct_answer_id = question.answers.find_by(correct: true).try(:id) || 0
      puts correct_answer_id
      puts questions_with_answers["#{question.id}"] 
      count += 1 if questions_with_answers["#{question.id}"].to_i == correct_answer_id
    end
    
    redirect_to :back, notice: "Правильных ответов: #{count}"
  end
  
end