class IntegrationsController < ApplicationController
  def index
    @answers = Answer.where(subject_id: params[:q])
    @subjects = Subject.all
  end

  def search
    index
    render :index
  end
end