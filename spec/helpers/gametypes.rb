module GameTypes

  def play_tie_game
    play_partial_game
    board.claim_field(:six, :o)
    board.claim_field(:five, :x)
    board.claim_field(:eight, :o)
    board.claim_field(:seven, :x)
  end

  def play_partial_game
    board.claim_field(:zero, :x)
    board.claim_field(:one, :o)
    board.claim_field(:two, :x)
    board.claim_field(:three, :o)
    board.claim_field(:four, :x)
  end

  def play_row_claimed_game
    board.claim_field(:zero, :x)
    board.claim_field(:three, :o)
    board.claim_field(:one, :x)
    board.claim_field(:six, :o)
    board.claim_field(:two, :x)
  end

  def play_column_claimed_game
    board.claim_field(:zero, :x)
    board.claim_field(:one, :o)
    board.claim_field(:three, :x)
    board.claim_field(:two, :o)
    board.claim_field(:six, :x)
  end

  def play_diagonal_claimed_game
    board.claim_field(:zero, :x)
    board.claim_field(:one, :o)
    board.claim_field(:four, :x)
    board.claim_field(:two, :o)
    board.claim_field(:eight, :x)
  end

end
