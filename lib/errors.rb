module Errors
  class OutOfBound < StandardError
    def message
      "Error Message: Field outside available area"
    end
  end

  class Occupied < StandardError
    def message
      "Error Message: Field already occupied"
    end
  end

  class NotPlayersTurn < StandardError
    def message
      "Error Message: Wrong player, It is not your turn"
    end
  end

  class GameOver < StandardError
    def message
      "Error Message: Game over, Invalid move"
    end
  end

end
