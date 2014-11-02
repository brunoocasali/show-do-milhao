class IntegrationsController < ApplicationController
  def index
    set_objects
  end

  private
  def set_objects
    @answers = Answer.where(subject_id: params[:subject_id])
    @questions = Question.where(subject_id: params[:subject_id])
    @subjects = Subject.all
  end
end