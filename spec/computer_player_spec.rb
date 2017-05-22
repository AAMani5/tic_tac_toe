require 'computer_player'
require 'board'

describe ComputerPlayer do
  let(:computer_player) {ComputerPlayer.new(:o)}
  let(:board) {Board.new}

  it "#symbol" do
    expect(computer_player.symbol).to eql :o
  end

  context "#make_move" do

    it "makes its first move" do
      expect(computer_player.make_move(board, :o)).to eql :one
    end

    it "" do
      board.claim_field(:zero, :o)
      expect(computer_player.make_move(board, :o)).to eql nil
    end

  end

end
