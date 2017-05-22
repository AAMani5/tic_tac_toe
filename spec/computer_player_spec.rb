require 'computer_player'

describe ComputerPlayer do
  let(:computer_player) {ComputerPlayer.new(:o)}

  it "#symbol" do
    expect(computer_player.symbol).to eql :o
  end

  it "#" do
    expect{computer_player.make_move}.to_not raise_error
  end

end
