class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    authorize! :create, @answer
  end

  # GET /answers/1/edit
  def edit
    authorize! :edit, @answer
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer].permit(:body, :correctly))

    redirect_to question_path(@question)
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    authorize! :edit, @answers
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    redirect_to question_path(@question)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body, :correctly, :question_id)
    end
end
