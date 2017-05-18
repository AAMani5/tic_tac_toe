class Board

  def initialize
    create_table
  end

  def get_table
    @table
  end

  private

  def create_table
    @table = [:zero, :one, :two, :three, :four, :five, :six, :seven, :eight]
  end

end
