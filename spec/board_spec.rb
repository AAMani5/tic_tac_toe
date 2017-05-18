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
      expect{board.claim_field(:two, :x)}.to raise_error "occupied"
    end

    it "raise exception if field position out of bound" do
      expect{board.claim_field(:nine, :x)}.to raise_error "outofbound"
    end

  end

end
