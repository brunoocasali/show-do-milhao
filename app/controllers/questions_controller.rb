class QuestionsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show; end

  def new
    @question = Question.new
    @subjects = Subject.all

    4.times { @question.answers.build }
  end

  def edit
    @subjects = Subject.all
    counter = @question.answers.count
    if counter < 4
      (4 - counter).times { @question.answers.build }
    end
  end

  def create
    @question = Question.new(question_params)

    params[:question][:answers_attributes].map do |k, v|
      @question.answers << Answer.new(title: v[:title], question_id: @question.id,
                                      is_correct: v[:is_correct])
    end

    if @question.save
      redirect_to @question, notice: 'Parabéns, questão cadastrada com a devida maestria!!'
    else
      render :new
    end
  end

  def update
    #.map do |k, v|
      @question.answers.update(params[:question][:answers_attributes])
    #end

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

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
    params.require(:question).permit(:description, :subject_id)
  end
end
