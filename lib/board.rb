require_relative 'ship'


class Board
  DEFAULT_SIZE = 10 
  attr_reader :size, :b, :used_coordinates,:n_of_X

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

  def place (ship,x,y,orientation) 
  case orientation 
    when "S" 
      fail 'Outside the board' unless x <= size && y <= size
      fail 'Outside the board' unless x <= size && y+1 <= size
      fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + y.to_s) 
      fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + (y+1).to_s) 
      @n_of_X += 2
      @used_coordinates << x.to_s + y.to_s
      @used_coordinates << x.to_s + (y+1).to_s
      b[y][x] = 'X'
      b[y+1][x] = 'X'
    when "N"
      fail 'Outside the board' unless x <= size && y <= size
      fail 'Outside the board' unless x <= size && y-1 <= size
      fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + y.to_s) 
      fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + (y-1).to_s) 
      @n_of_X += 2
      @used_coordinates << x.to_s + y.to_s
      @used_coordinates << x.to_s + (y-1).to_s
      b[y][x] = 'X'
      b[y-1][x] = 'X'
    when "E"
      fail 'Outside the board' unless x <= size && y <= size
      fail 'Outside the board' unless x+1 <= size && y <= size
      fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + y.to_s) 
      fail 'Those coordinates are already used!' if @used_coordinates.include? ((x+1).to_s + y.to_s) 
      @n_of_X += 2
      @used_coordinates << x.to_s + y.to_s
      @used_coordinates << (x+1).to_s + y.to_s
      b[y][x] = 'X'
      b[y][x+1] = 'X'
    when "W"
      fail 'Outside the board' unless x <= size && y <= size
      fail 'Outside the board' unless x-1 <= size && y <= size
      fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + y.to_s) 
      fail 'Those coordinates are already used!' if @used_coordinates.include? ((x-1).to_s + y.to_s) 
      @n_of_X += 2
      @used_coordinates << x.to_s + y.to_s
      @used_coordinates << (x-1).to_s + y.to_s
      b[y][x] = 'X'
      b[y][x-1] = 'X'
  end 
  end

  def fire(x,y)
    b[y][x] == '0' ? b[y][x] = 'M' : b[y][x] = 'H' 
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

