require_relative 'player'
require_relative 'board'

class ComputerPlayer
  include Player

  def make_move(board, opponent_sym)
    return :one if first_move?(board.get_table)
  end

  private

  def first_move?(table)
    Board::TABLE & table == Board::TABLE
  end

  def assign_score(board, opponent_sym)
    return 1 if i_am_winning?
    return -1 if opponent_is_winning?
    return 0 if tie_game?
  end

  def i_am_winning?
    board.winning_fields_claimed_by(symbol, opponent_sym) == symbol
  end

  def opponent_is_winning?
    board.winning_fields_claimed_by(symbol, opponent_sym) == opponent_sym
  end

  def tie_game?
    board.all_fields_claimed?(symbol, opponent_sym) && !board.winning_fields_claimed?(symbol, opponent_sym)
  end

end
