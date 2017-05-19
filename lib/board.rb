require_relative 'errors'

class Board
  include Errors
  attr_reader :get_table
  TABLE = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight]

  # :zero   :one  :two
  # :three  :four :five
  # :six    :seven  :eight


  def initialize
    @get_table = TABLE
  end

  def claim_field(position, player_symbol)
    fail Errors::OutOfBound if field_location_outofbound?(position)
    fail Errors::Occupied if !field_not_occupied?(position)
    @get_table = get_table.map{|pos| pos == position ? player_symbol : pos}
  end

  def all_fields_claimed?(player1_symbol, player2_symbol)
    get_table.all?{|field| field == player1_symbol || field == player2_symbol}
  end

  def winning_fields_claimed?(player1_symbol, player2_symbol)
    rows_claimed?(player1_symbol, player2_symbol) || columns_claimed?(player1_symbol, player2_symbol) || diagonals_claimed?(player1_symbol, player2_symbol)
  end

  def field_not_occupied?(position)
    get_table.include? position
  end

  private

  def field_location_outofbound?(position)
    !(TABLE.include? position)
  end

  def rows_claimed?(player1_symbol, player2_symbol)
    row0claimed = check(get_row(0), player1_symbol, player2_symbol)
    row1claimed = check(get_row(1), player1_symbol, player2_symbol)
    row2claimed = check(get_row(2), player1_symbol, player2_symbol)
    [row0claimed, row1claimed, row2claimed].any? {|element| element == true}
  end

  def columns_claimed?(player1_symbol, player2_symbol)
    column0claimed = check(get_column(0), player1_symbol, player2_symbol)
    column1claimed = check(get_column(1), player1_symbol, player2_symbol)
    column2claimed = check(get_column(2), player1_symbol, player2_symbol)
    [column0claimed, column1claimed, column2claimed].any? {|element| element == true}
  end

  def diagonals_claimed?(player1_symbol, player2_symbol)
    diagonal0claimed = check(get_diagonal(0), player1_symbol, player2_symbol)
    diagonal1claimed = check(get_diagonal(1), player1_symbol, player2_symbol)
    [diagonal0claimed, diagonal1claimed].any? {|element| element == true}
  end

  def get_row(row_number)
    case row_number
    when 0
      [get_table[0], get_table[1], get_table[2]]
    when 1
      [get_table[3], get_table[4], get_table[5]]
    when 2
      [get_table[6], get_table[7], get_table[8]]
    else
      raise Errors::OutOfBound
    end
  end

  def get_column(column_number)
    case column_number
    when 0
      [get_table[0], get_table[3], get_table[6]]
    when 1
      [get_table[1], get_table[4], get_table[7]]
    when 2
      [get_table[2], get_table[5], get_table[8]]
    else
      raise Errors::OutOfBound
    end
  end

  def get_diagonal(diagonal_number)
    case diagonal_number
    when 0
      [get_table[0], get_table[4], get_table[8]]
    when 1
      [get_table[2], get_table[4], get_table[6]]
    else
      raise Errors::OutOfBound
    end
  end

  def check(set_of_fields, player1_symbol, player2_symbol)
    set_of_fields.all? {|field| field == player1_symbol} ||
    set_of_fields.all? {|field| field == player2_symbol}
  end

end
