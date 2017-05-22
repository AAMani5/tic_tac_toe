require 'computer_player'
require 'board'
require 'human_player'
require 'game'

describe ComputerPlayer do
  let(:computer_player) {ComputerPlayer.new(:x)}
  let(:human_player) {HumanPlayer.new(:o)}
  let(:board) {Board.new}
  let(:game) {Game.new(board, human_player, computer_player)}

  it "#symbol" do
    expect(computer_player.symbol).to eql :x
  end

  context "#make_move" do

    it "makes its first move" do
      expect(computer_player.make_move(game, board, :o)).to eql :one
    end

    it "doesnot return a field without calculating the best move" do
      game.make_mark(:zero, human_player)
      expect(computer_player.make_move(game, board, :o)).to eql nil
    end

  end

end
