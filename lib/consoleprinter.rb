class ConsolePrinter

  def initialize(output = $stdout)
    @output = output
  end

  def welcome_message(table)
    output.puts "Welcome to Tic Tac Toe - Fun interactive game"
    print_board(table)
  end

  def print_board(table)
    output.puts table.each_slice(3).map{|s| s.join("\t|\t")}.join("\n_______________________________________\n")
  end

  def clear_screen
    system ("clear")
  end

  def ask_player_symbol(player)
    output.puts "What symbol would you like to choose, #{player}?"
  end

  def display_gametype_options
    output.puts "You can choose from the following options to begin"
    output.puts "0. Human vs. Human"
    output.puts "1. Human vs. Computer"
    output.puts "2. Computer vs. Computer"
  end

  def ask_who_goes_first(player1_sym, player2_sym)
    output.puts "Who should go first?"
    output.puts "0. #{player1_sym}"
    output.puts "1. #{player2_sym}"
  end

  def option_chosen(option)
    output.puts "You have chosen option #{option}"
  end

  def display_turn(current_player_sym)
    output.puts "#{current_player_sym}'s turn"
  end

  def ask_position
    output.puts "Please select a unclaimed field"
  end

  def game_over_message
    output.puts "Game Over"
  end

  def announce_winner(player_sym)
    output.puts "Winner is #{player_sym}"
  end

  private
  attr_reader :output

end
