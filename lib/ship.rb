class Ship

  attr_reader :pos

  def initialize
    @pos = ''
  end

  def position (num)
    letter = num[0]
    nums = num[1..-1]
    fail 'Outside the board' unless letter != /^[A-J]/
    fail 'Outside the board' if nums != /[1-10]/
    @pos = num
  end
end