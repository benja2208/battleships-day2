class Ship

  attr_reader :ships

  def initialize
    @ships = []
  end

  def create
    @ships << Ship.new
  end

  def empty?
    @ships.empty?
  end

  def full?

  end
end
