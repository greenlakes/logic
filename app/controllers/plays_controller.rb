class PlaysController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id]) 
  end


  def check_results
    quiz = Quiz.find(params[:quiz][:id]) 
    count = 0
    
    if questions_with_answers = params[:quiz][:questions]
      quiz.questions.each do |question|
        correct_answer = question.answers.find_by(correct: true).try(:id)
        user_answer    = questions_with_answers[question.id.to_s].to_i
        count += 1 if user_answer == correct_answer
      end
      
      # Вот тут нужно создавать Play для текущего пользователя
      # с записью количества правильных ответов – current_user.plays.create(...)


    @play = current_user.plays.create(quiz_id: params[:quiz][:id].to_i, points: count.to_i)
    
    end
    
    redirect_to :back, notice: "Правильных ответов: #{count}"
  end
  
end