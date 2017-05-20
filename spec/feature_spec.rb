require 'human_player'
require 'board'
require 'game'

describe "Feature spec - Human vs Human" do
  let(:player1) {HumanPlayer.new(:x)}
  let(:player2) {HumanPlayer.new(:o)}
  let(:board) {Board.new()}
  let(:game) {Game.new(board, player1, player2)}

  context "Game won" do

    it "row claimed" do
      play_row_claimed_game
      expect(game.over?).to be true
      expect{game.make_mark(:one, player2)}.to raise_error Errors::GameOver
    end

    it "column claimed" do
      play_column_claimed_game
      expect(game.over?).to be true
      expect{game.make_mark(:one, player2)}.to raise_error Errors::GameOver
    end

    it "diagonal claimed" do
      play_diagonal_claimed_game
      expect(game.over?).to be true
      expect{game.make_mark(:one, player2)}.to raise_error Errors::GameOver
    end

  end

  context "Tie game" do

    it "all fields claimes" do
      play_tie_game
      expect(game.over?).to be true
      expect{game.make_mark(:one, player2)}.to raise_error Errors::GameOver
    end

  end

end
