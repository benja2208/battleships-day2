require_relative 'ship'

class Board
  DEFAULT_SIZE = 10 
  attr_reader :grid

  def initialize (size_board = DEFAULT_SIZE)
      @board = Array.new(size_board) {Array.new(size_board,'O')}
      @grid=[]
  end

  def see_board
    @board.each do |r|
      puts r.map { |p| p }.join(" ")
    end 
  end 


  def place
    @grid = $e_ships
  end

  def empty?
    @board.empty?
  end

  def fire(pos)
    return 'Hit' if @board.include? (pos)
  end
end

