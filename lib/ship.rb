require_relative 'board'

class Ship

  attr_reader :size

  def initialize 
    @size = 3
  end 
end


# $e_ships = []
#     letter = num[0]
#     nums = num[1..-1]
#     fail 'Outside the board' unless letter =~ /^[A-J]/
#     fail 'Outside the board' unless nums.to_i <= 10
#     @pos = num
#     $e_ships << num