require 'human_player'

describe HumanPlayer do
  let(:human_player) {HumanPlayer.new(:x)}

  it "#symbol" do
    expect(human_player.symbol).to eql :x
  end

end
