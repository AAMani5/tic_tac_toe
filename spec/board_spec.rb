require 'board'

describe Board do

  it "#new" do
    expect{Board.new}.to_not raise_error
  end

end
