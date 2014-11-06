class IntegrationsController < ApplicationController
  before_action :set_question, only: :update

  def index
    set_objects
  end

  def update
    type = params[:type]

    if type.eql? 'drop'
      @question.update(integration_params)
    elsif type.eql? ''
      @question.update(integration_params)
    else
      @question.update(integration_params)
    end

    render :index
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
    @question = Question.find(params[:question_id])
  end

  def integration_params
    params.require(:user).permit(:correct_answer_id)
  end
end