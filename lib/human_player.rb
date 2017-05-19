require_relative 'player'

class HumanPlayer
  include Player

  def initialize(symbol)
    @symbol = symbol
  end

end
