class QuestionsController < ApplicationController
  
  before_action :verify_is_admin
  
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @answers = Answer.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
     @answer = Answer.find(params[:id])
  end

  # GET /quizzes/new
  def new
    @answer = Answer.new
  end

  # GET /quizzes/1/edit
  def edit
     @answer = Answer.find(params[:id])
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @answer = Answer.new(answer_params)

    
      if @answer.save
         redirect_to @answer, notice: 'Answer was successfully created.'
        
      else
       render :new
        
      end
    
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
   
      if @answer.update(answer_params)
        redirect_to @answer, notice: 'Answer was successfully updated.'
        
      else
        render :edit
      
      end
    
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @answer.destroy
    
      redirect_to answers_url, notice: 'Answer was successfully destroyed.' 
      
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(
      :body, :question_id, 
      answers_attributes: [:id, :_destroy, :body]
      )
    end

end
