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
      board_fully_occupied
      expect(board.all_fields_claimed?(:x, :o)).to be true
    end

    it "indicates when the board is not completely filled" do
      board_partially_occupied
      expect(board.all_fields_claimed?(:x, :o)).to be false
    end

  end

  context "#winning_fields_claimed" do
    it "indicates when game won - row claimed" do
      row_claimed_board
      expect(board.winning_fields_claimed?(:x, :o)).to be true
    end

    it "indicates when game won - columns claimed" do
      column_claimed_board
      expect(board.winning_fields_claimed?(:x, :o)).to be true
    end

    it "indicates when game won - diagonal row claimed" do
      diagonal_claimed_board
      expect(board.winning_fields_claimed?(:x, :o)).to be true
    end

    it "indicates when game is not won" do
      board_partially_occupied
      expect(board.winning_fields_claimed?(:x, :o)).to be false
    end

  end

  context "#field_not_occupied" do
    it "indicates when a field is not marked" do
      expect(board.field_not_occupied?(:one)).to be true
    end

    it "indicates when a field has already been marked" do
      board.claim_field(:one, :x)
      expect(board.field_not_occupied?(:one)).to be false
    end

  end

  context "#field_location_outofbound" do
    it "indicates if field not within the array index" do
      expect(board.field_location_outofbound?(:ten)).to be true
    end

    it "indicates if a field is within the array index" do
      expect(board.field_location_outofbound?(:one)).to be false
    end

  end

  context "#available_fields" do
    it "lists all unclaimed fields" do
      board_partially_occupied
      expect(board.available_fields).to eql [:five, :six, :seven, :eight]
    end

  end

end
