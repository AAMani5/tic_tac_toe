class Game

  attr_reader :current_player, :opponent_player

  def initialize(board, player1, player2)
    @board = board
    @players = [player1, player2]
    @current_player = player1
    @opponent_player = player2
  end

  def make_mark(position, player)
    pre_mark_checks_ok(position, player)
    board.claim_field(position, player.symbol)
    switch_players
  end

  def over?
     self.tie? || won?
  end

  def tie?
    board.all_fields_claimed?(current_player.symbol, opponent_player.symbol) && !won?
  end

  def get_table
    board.get_table
  end

  private
  attr_reader :board, :players

  def won?
    board.winning_fields_claimed?(current_player.symbol, opponent_player.symbol)
  end

  def pre_mark_checks_ok(position, player)
    raise Errors::GameOver.new if self.over?
    raise Errors::NotPlayersTurn.new unless current_player == player
    raise Errors::OutOfBound.new if board.field_location_outofbound?(position)
    raise Errors::Occupied.new unless board.field_not_occupied?(position)
  end

  def switch_players
    @current_player = opponent_player
    @opponent_player = players.select{|player| player != current_player}[0]
  end

end
