require 'consoleprinter'

describe ConsolePrinter do
  let(:table) {[:zero, :one, :two]}
  let(:printer) {ConsolePrinter.new}

  it "prints a welcome message and board" do
    expect{ printer.welcome_message(table) }.to output("Welcome to Tic Tac Toe - Fun interactive game\nzero\t|\tone\t|\ttwo\n").to_stdout
  end

  it "displays game options" do
    expect { printer.display_gametype_options }.to output("You can choose from the following options to begin\n0. Human vs. Human\n1. Human vs. Computer\n2. Computer vs. Computer\n").to_stdout
  end

  it "confirms option choosen" do
    expect { printer.option_chosen("0") }.to output("You have chosen option 0\n").to_stdout
  end

  it "print the table" do
    expect { printer.print_board(table) }.to output("zero\t|\tone\t|\ttwo\n").to_stdout
  end

  it "asks player for symbol of his or her choice" do
    expect{ printer.ask_player_symbol("player1") }.to output("What symbol would you like to choose, player1?\n").to_stdout
  end

  it "asks who wants to go first" do
    expect{ printer.ask_who_goes_first("x", "o") }.to output("Who should go first?\n0. x\n1. o\n").to_stdout
  end

  it "prints current player's turn" do
    expect { printer.display_turn("x") }.to output("x's turn\n").to_stdout
  end

  it "asks for position" do
    expect { printer.ask_position }.to output("Please select a unclaimed field\n").to_stdout
  end

  it "displays game over message" do
    expect { printer.game_over_message }.to output("Game Over\n").to_stdout
  end

  it "displays winner if there is one" do
    expect { printer.announce_winner("x") }.to output("Winner is x\n").to_stdout
  end

  it "clears the screen" do
    expect(printer).to receive(:system).with("clear")
    printer.clear_screen
  end

end
