class GamesController < ApplicationController
  before_action :authenticate_player!
  before_action :set_game, only: :show

  def show
    @games = Game.last_games
  end

  # GET /games/new
  def new
    @game = Game.create(player: current_player)
    unless @game.nil?
      redirect_to game_round_path(@game, @game.rounds.first)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:user_id, :worth, :image, :winner)
    end
end
