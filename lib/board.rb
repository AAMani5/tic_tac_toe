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
    fail Errors::Occupied if field_occupied?(position)
    @get_table = get_table.map{|pos| pos == position ? player_symbol : pos}
  end

  def all_fields_claimed?(player1_symbol, player2_symbol)
    get_table.all?{|field| field == player1_symbol || field == player2_symbol}
  end

  private

  def field_location_outofbound?(position)
    !(TABLE.include? position)
  end

  def field_occupied?(position)
    !(get_table.include? position)
  end

end
