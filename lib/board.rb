require_relative 'ship'


class Board
  DEFAULT_SIZE = 10 
  attr_reader :size, :grid, :used_coordinates,:number_of_lives

  def initialize (size_board = DEFAULT_SIZE)
      @grid = Array.new(size_board) {Array.new(size_board,'0')}
      @used_coordinates= []
      @size = size_board
  end

  def see_board
    @grid.each do |r|
      puts r.map { |p| p }.join(" ")
    end 
    nil
  end 


  def place (ship, coord, orientation)
    raise 'Outside the board' if any_coord_not_on_board?(all_coords(coord, ship.size, orientation))
      all_coords(coord, ship.size, :vertically).each do |coord|
      grid[coord.first][coord.last] = 'X'
    end
    # case orientation 
    #   when "Vertical" 
    #     fail 'Outside the board' unless x <= size && y+1 <= size
    #     fail 'Those coordinates are already used!' if @used_coordinates.include? (x.to_s + (y+1).to_s) 
    #     @used_coordinates += [(x.to_s + y.to_s),(x.to_s + (y+1).to_s)]
    #     b[y+1][x] = 'X'
    #   when "Horizontal"
    #     fail 'Outside the board' unless x+1 <= size && y <= size
    #     fail 'Those coordinates are already used!' if @used_coordinates.include? ((x+1).to_s + y.to_s) 
    #     @used_coordinates += [(x.to_s + y.to_s),((x+1).to_s + y.to_s)]
    #     b[y][x+1] = 'X'
    # end 
    # @number_of_X += 2
    # b[y][x] = 'X'
    # see_board
  end

  def number_of_lives 
    grid.inject(0){|memo, row| memo + row.count('X')}
  end

  def any_coord_not_on_board?(coords)
    coords.any? do |coord|
      grid[coord.first][coord.last].nil? rescue true
    end   
  end

  def fire(x,y)
    grid[y][x] == '0' ? grid[y][x] = 'M' : grid[y][x] = 'H' 
  end

  def convert_to_array(coordinate)
    x, y = coordinate.to_s.split('')
    [x.ord - 97,y.to_i - 1]
  end

  def all_coords coord, size, orientation
    coords = [coord]
    (size - 1).times {coords << (orientation == :horizontally ? coords.last.next : next_vertical_coord(coords.last))}
    coords.map{|coordinate|convert_to_array(coordinate)}
  end

  def next_vertical_coord(coord)
    coord.to_s.reverse.next.reverse.to_sym
  end
  
  def number_of_hits
    c = b.flatten
    c.count('H')
  end 

  def number_of_misses
    c = grid.flatten
    c.count('M')
  end 

  def log 
    "H:#{number_of_hits}, M:#{number_of_misses}"
  end 

  def victory?
    number_of_hits == @number_of_lives ? true : false
  end 
end

