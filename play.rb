#!/usr/bin/env ruby

require_relative 'lib/board'
require_relative 'lib/consoleprinter'
require_relative 'lib/outputcolour'
require_relative 'lib/game'
require_relative 'lib/human_player'

printer = ConsolePrinter.new
board = Board.new
printer.welcome_message(board.get_table)
printer.display_gametype_options
user_input = STDIN

while gametype_option = user_input.gets.chomp
  case gametype_option
  when "0"
     printer.option_chosen(gametype_option)
     printer.ask_player_symbol("player 1")
     while player1_sym = user_input.gets.chomp
       case
       when player1_sym != ""
         player1 = HumanPlayer.new(player1_sym)
         break
       else
         printer.ask_player_symbol("player 1")
       end
     end

     printer.ask_player_symbol("player 2")
     while player2_sym = user_input.gets.chomp
       case
       when player2_sym != ""
         player2 = HumanPlayer.new(player2_sym)
         break
       else
         printer.ask_player_symbol("player 2")
       end
     end

     printer.ask_who_goes_first(player1.symbol, player2.symbol)
     while first_player = user_input.gets.chomp
       case first_player
       when "0"
         game = Game.new(board, player1, player2)
         printer.print_board(game.get_table)
         break
       when "1"
         game = Game.new(board, player2, player1)
         printer.print_board(game.get_table)
         break
       else printer.ask_who_goes_first(player1, player2)
       end
     end

     until game.over?
       printer.display_turn(game.current_player.symbol)
       printer.ask_position
       position = user_input.gets.chomp
       begin
         game.current_player == player1 ? position.green : position.red
         game.make_mark(position.to_sym, game.current_player)
         printer.print_board(game.get_table)
       rescue Errors::OutOfBound => e
         printer.error_message(e.message)
       rescue Errors::Occupied => e
         printer.error_message(e.message)
       end
     end

     printer.game_over_message
     printer.announce_winner(game.opponent_player.symbol) unless game.tie?
     break # for choice 0
  when "1"
    printer.option_chosen(gametype_option)
    break # for choice 1
  when "2"
    printer.option_chosen(gametype_option)
    break # for choice 2
  else
    printer.display_gametype_options
  end
end
