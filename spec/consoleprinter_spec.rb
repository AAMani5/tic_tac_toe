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

end
