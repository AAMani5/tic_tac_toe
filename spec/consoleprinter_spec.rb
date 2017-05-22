require 'consoleprinter'

describe ConsolePrinter do
  let(:table) {[:zero, :one, :two]}
  let(:printer) {ConsolePrinter.new}
  let(:console) {StringIO.new}

  it "prints a welcome message and board" do
    expect{ printer.welcome_message(table) }.to output("Welcome to Tic Tac Toe - Fun interactive game\nzero\t|\tone\t|\ttwo\n").to_stdout
  end

end
