require_relative 'ship'

class Board

  attr_reader :board

  def initialize
    @board = []
  end

  def place(ship)
    @board << ship
  end

  def empty?
    @board.empty?
  end

  def fire(pos)

  end
end
