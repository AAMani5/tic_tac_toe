module GameTypes

  def play_tie_game
    game.make_mark(:zero, player1)
    game.make_mark(:one, player2)
    game.make_mark(:two, player1)
    game.make_mark(:three, player2)
    game.make_mark(:four, player1)
    game.make_mark(:six, player2)
    game.make_mark(:five, player1)
    game.make_mark(:eight, player2)
    game.make_mark(:seven, player1)
  end

  def play_row_claimed_game
    game.make_mark(:zero, player1)
    game.make_mark(:three, player2)
    game.make_mark(:one, player1)
    game.make_mark(:six, player2)
    game.make_mark(:two, player1)
  end

  def play_column_claimed_game
    game.make_mark(:zero, player1)
    game.make_mark(:one, player2)
    game.make_mark(:three, player1)
    game.make_mark(:two, player2)
    game.make_mark(:six, player1)
  end

  def play_diagonal_claimed_game
    game.make_mark(:zero, player1)
    game.make_mark(:one, player2)
    game.make_mark(:four, player1)
    game.make_mark(:two, player2)
    game.make_mark(:eight, player1)
  end

end
