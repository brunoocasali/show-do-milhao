class RoundsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_round, only: [:show, :next]

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  def next
    @round.answer = Answer.find params[:round][:answer_id]
    @game = @round.game

    if @round.answer.eql? @round.question.correct_answer

      @round.game.worth = @round.worth

      if @round.worth >= 1_000_000
        @game.update(winner: true)
        @round.update(round_params)
        redirect_to game_path(@round.game)
      else
        @round.update(round_params)
        @round.id += 1
        redirect_to game_round_path(@round.game, @round), notice: nil
      end
    else # loser
      @game.update(winner: false, worth: @round.miss)
      notice = "A Resposta certa era: #{@round.question.correct_answer.title}"
      @round.update(round_params)
      redirect_to game_path(@round.game), notice: notice
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_round
    @round = Round.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def round_params
    params.require(:round).permit(:game_id, :question_id, :answer_id, :worth)
  end
end
