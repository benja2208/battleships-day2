require_relative 'ship'

class Board

  attr_reader :board

  def initialize
    @board = ''
  end

  def place
    @board = $e_ships
  end

  def empty?
    @board.empty?
  end

  def fire(pos)
    return 'Hit' if @board.include? (pos)
  end
end

