require 'board'

describe Board do
  let(:board) {Board.new}
  let(:table) {[:zero, :one, :two, :three, :four, :five, :six, :seven, :eight]}

  it "#get_table" do
    expect(board.get_table).to eql table
  end

end
