require 'errors'

describe "Errors" do
  let(:outofbound_error) {Errors::OutOfBound.new}
  let(:occupied_error) {Errors::Occupied.new}
  let(:notplaersturn_error) {Errors::NotPlayersTurn.new}
  let(:gameover_error) {Errors::GameOver.new}

  it "An instance of OutOfBound exception has a message" do
    expect(outofbound_error.message).to eql "Error Message: Field outside available area"
  end

  it "An instance of Occupied exception has a message" do
    expect(occupied_error.message).to eql "Error Message: Field already occupied"
  end

  it "An instance of NotPlayersTurn exception has a message" do
    expect(notplaersturn_error.message).to eql "Error Message: Wrong player, It is not your turn"
  end

  it "An instance of GameOver exception has a message" do
    expect(gameover_error.message).to eql "Error Message: Game over, Invalid move"
  end

end
