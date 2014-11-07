class IntegrationsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_question, only: [:update, :index]

  def index
    set_objects
  end

  def update
    type = params[:type].to_sym
    answer = Answer.find params[:answer_id]

   notice = if type.eql? :drop
      # case one. Be a option in the relation table.
      @question.answers.delete(answer) if @question.answers.include?(answer)

      # case two. Be a correct answer.
      @question.update(:correct_answer_id => nil) if @question.correct_answer_id == answer.id

      'Você deletou com vontade essa questão, isso é que é bonito!'
    elsif type.eql? :option
      @question.answers << answer unless @question.answers.size > 3 or
                                         @question.answers.include?(answer)

      'Mais uma opção uhulll!'
    elsif type.eql? :right
      @question.correct_answer_id = answer.id

      @question.save
      'Essa é agora uma resposta certa!!'
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: notice, subject_id: params[:subject_id] }
    end
  end

  private
  def set_objects
    @subjects = Subject.all
    @questions = Question.where(subject_id: params[:subject_id])
    @answers = if params.has_key?(:question_id) and params[:question_id] != ''
                 Answer.where(subject_id: params[:subject_id])
               else
                 []
               end
  end

  def set_question
    @question = Question.find_by(:id => params[:question_id])
  end
end