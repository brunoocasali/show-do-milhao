class QuestionsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @subjects = Subject.all

    4.times { @question.answers.new }
  end

  # GET /questions/1/edit
  def edit
    @subjects = Subject.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    if @question.save
      params[:question][:answers_attributes].map do |k, v|
        if @question.correct_answer_id.eql? k.to_i
          @question.correct_answer = Answer.create(title: v['title'])
        else
          @question.answers.create(title: v['title'])
        end
      end
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if @question.update(question_params)

      params[:question][:answers_attributes].map do |k, v|
        @question.answers.update(title: v['title'])
      end

      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
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
    params.require(:question).permit(:description, :correct_answer_id, :subject_id)
  end
end
