class RoundsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_round, only: [:show, :next, :jump]

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  def next
    @round.answer = Answer.find params[:round][:answer_id]

    if @round.game.finished?
      redirect_to game_path(@round.game), notice:
          'Ei, não adianta voltar já sei que você perdeu AHHAHAHAHAHAHAHHAHA!'
    else
      if @round.answer.eql? @round.question.correct_answer
        if @round.worth >= 1_000_000
          @round.game.update(winner: true, finished: true, worth: @round.worth)
          @round.update(round_params)
          redirect_to game_path(@round.game)
        else
          @round.update(round_params)
          @round.id += 1
          redirect_to game_round_path(@round.game, @round), notice: nil
        end
      else # loser
        @round.game.update(winner: false, worth: @round.miss, finished: true)
        notice = "A Resposta certa era: #{@round.question.correct_answer.title}"
        @round.update(round_params)
        redirect_to game_path(@round.game), notice: notice
      end
    end
  end

  def jump
    @round.game.update_attributes(jump: @round.game.jump -= 1)
    @round.id += 1
    redirect_to game_round_path(@round.game, @round), notice: nil
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
