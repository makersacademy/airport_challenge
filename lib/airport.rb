require_relative 'plane'

class Airport

DEF_CAPACITY = 5

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    raise "Go away. Airport is full." if full?
    @runway << plane
  end

  def take_off(plane)
    @runway.delete(plane)
    "#{plane} has buggered off."
  end

attr_reader :runway
attr_reader :capacity


private
  def full?
    @runway.length == @capacity
  end

end
