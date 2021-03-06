class QuizzesController < ApplicationController
  
  before_action :verify_is_admin
  
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    @quiz = Quiz.find(params[:id])
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
     @quiz = Quiz.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    
      if @quiz.save
       
         redirect_to @quiz, notice: 'Quiz was successfully created.'
        
      else
       render :new
        
      end
    
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
   
      if @quiz.update(quiz_params)
        redirect_to @quiz, notice: 'Quiz was successfully updated.'
        
      else
        render :edit
      
      end
    
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    
      redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' 
      
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(
      :title, :category_id, :published, 
      questions_attributes: [:id, :_destroy, :number, :body, answers_attributes:[:id, :_destroy, :body]]
      )
    end

end