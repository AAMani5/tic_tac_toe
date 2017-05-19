require 'board'

describe Board do
  let(:board) {Board.new}
  let(:table) {[:zero, :one, :two, :three, :four, :five, :six, :seven, :eight]}

  it "#get_table" do
    expect(board.get_table).to eql table
  end

  context "#claim_field" do
    it "claim a non claimed field" do
      expect(board.claim_field(:two, :x)).to eql [:zero, :one, :x, :three, :four, :five, :six, :seven, :eight]
    end

    it "raise exception if field already claimed" do
      board.claim_field(:two, :x)
      expect{board.claim_field(:two, :x)}.to raise_error Errors::Occupied
    end

    it "raise exception if field position out of bound" do
      expect{board.claim_field(:nine, :x)}.to raise_error Errors::OutOfBound
    end

  end

  context "#all_fields_claimed" do
    it "indicates when a board is filled" do
      play_tie_game
      expect(board.all_fields_claimed?(:x, :o)).to be true
    end

    it "indicates when the board is not completely filled" do
      play_partial_game
      expect(board.all_fields_claimed?(:x, :o)).to be false
    end

  end

end
