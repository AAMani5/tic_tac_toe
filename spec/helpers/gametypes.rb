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

end
