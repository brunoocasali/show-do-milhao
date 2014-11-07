class RoundsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  def next
    if @round.answer.eql? @round.question.correct_answer

      @round.game.worth = @round.worth

      if @round.worth >= 1_000_000
        @round.game.winner = true
        redirect_to game_path(@round.game)
      else
        @round.id += 1
      end
    else # loser
      @round.game.worth = @round.miss

      @round.errors.add(:base, "A Resposta certa era:
                                                  <b>#{@round.question.correct_answer.title}</b>")
    end

    redirect_to game_round_path(@round.game, @round)
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
