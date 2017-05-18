class Board
  attr_reader :get_table
  TABLE = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight]

  def initialize
    @get_table = TABLE
  end

  def claim_field(position, player_symbol)
    fail "outofbound" if field_location_outofbound(position)
    fail "occupied" if field_occupied(position)
    @get_table = @get_table.map{|pos| pos == position ? player_symbol : pos}
  end

  private

  def field_location_outofbound(position)
    !(TABLE.include? position)
  end

  def field_occupied(position)
    !(get_table.include? position)
  end

end
