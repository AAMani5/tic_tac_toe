module Errors
  class OutOfBound < StandardError; end
  class Occupied < StandardError; end
  class NotPlayersTurn < StandardError; end
  class GameOver < StandardError; end
end
