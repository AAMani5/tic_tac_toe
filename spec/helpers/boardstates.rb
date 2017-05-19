module BoardStates

  def board_fully_occupied
    board_partially_occupied
    board.claim_field(:six, :o)
    board.claim_field(:five, :x)
    board.claim_field(:eight, :o)
    board.claim_field(:seven, :x)
  end

  def board_partially_occupied
    board.claim_field(:zero, :x)
    board.claim_field(:one, :o)
    board.claim_field(:two, :x)
    board.claim_field(:three, :o)
    board.claim_field(:four, :x)
  end

  def row_claimed_board
    board.claim_field(:zero, :x)
    board.claim_field(:three, :o)
    board.claim_field(:one, :x)
    board.claim_field(:six, :o)
    board.claim_field(:two, :x)
  end

  def column_claimed_board
    board.claim_field(:zero, :x)
    board.claim_field(:one, :o)
    board.claim_field(:three, :x)
    board.claim_field(:two, :o)
    board.claim_field(:six, :x)
  end

  def diagonal_claimed_board
    board.claim_field(:zero, :x)
    board.claim_field(:one, :o)
    board.claim_field(:four, :x)
    board.claim_field(:two, :o)
    board.claim_field(:eight, :x)
  end

end
