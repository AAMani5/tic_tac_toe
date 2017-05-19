require 'game'

describe Game do
  let(:board) {double :board, :field_not_occupied? => true, :claim_field => []}
  let(:player1) {double :player1, :symbol => :x}
  let(:player2) {double :player2, :symbol => :o}
  let(:game) {Game.new(board, player1, player2)}

  context "#make_mark" do
    it "lets the right player make a mark" do
      expect(board).to receive(:claim_field)
      expect{game.make_mark(:zero, player1)}.to_not raise_error
    end

    it "raises error if it's not the players turn" do
      game.make_mark(:zero, player1)
      expect{game.make_mark(:one, player1)}.to raise_error Errors::NotPlayersTurn
    end

    it "raises error if the field has already been claimed" do
      game.make_mark(:zero, player1)
      allow(board).to receive(:field_not_occupied?).with(:zero).and_return(false)
      expect{game.make_mark(:zero, player2)}.to raise_error Errors::Occupied
    end

  end

  context "#over" do
    it "indicates if a game is over - won" do

    end

    it "indicates if a game is over - tie" do

    end

    it "indicates if a game is not over" do

    end

  end

end
