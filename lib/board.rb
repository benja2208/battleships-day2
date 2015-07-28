require_relative 'ship'

class Board
  DEFAULT_SIZE = 10 
  attr_reader :size
  attr_accessor :b
  attr_accessor :used_coordinates
  attr_reader :n_of_X

  def initialize (size_board = DEFAULT_SIZE)
      @b = Array.new(size_board) {Array.new(size_board,'0')}
      @used_coordinates= []
      @size = size_board
      @n_of_X = 0
  end

  def see_board
    @b.each do |r|
      puts r.map { |p| p }.join(" ")
    end 
  end 

  def place (ship,x,y) 
    fail 'Outside the board' unless x <= @size && y <= @size
    fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + y.to_s) 
    @n_of_X += 1
    @used_coordinates << x.to_s + y.to_s
    b[y - 1][x - 1] = 'X'
  end

  def fire(x,y)
    b[y - 1][x - 1] == '0' ? b[y - 1][x - 1] = 'M' : b[y - 1][x - 1] = 'H' 
  end
  
  def number_of_hits
    c = b.flatten
    c.count('H')
  end 

  def number_of_misses
    c = b.flatten
    c.count('M')
  end 

  def log 
    "H:#{number_of_hits}, M:#{number_of_misses}"
  end 

  def victory?
    number_of_hits == @n_of_X ? true : false
  end 
end

