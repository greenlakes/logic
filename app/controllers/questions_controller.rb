class QuizzesController < ApplicationController
  
  before_action :verify_is_admin
  
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @questions = Question.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
     @question = Question.find(params[:id])
  end

  # GET /quizzes/new
  def new
    @question = Question.new
  end

  # GET /quizzes/1/edit
  def edit
     @question = Question.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @question = Question.new(question_params)

    
      if @question.save
         redirect_to @question, notice: 'Question was successfully created.'
        
      else
       render :new
        
      end
    
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
   
      if @question.update(question_params)
        redirect_to @question, notice: 'Question was successfully updated.'
        
      else
        render :edit
      
      end
    
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @question.destroy
    
      redirect_to questions_url, notice: 'Question was successfully destroyed.' 
      
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(
      :body, :quiz_id, 
      answers_attributes: [:id, :_destroy, :body]
      )
    end

end
