require_relative 'plane'

class Airport

  DEF_CAPACITY = 20

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
      fail "Go away. Airport is full." if full?
      # raise "The weather is a bit mental best not to land." if stormy?
      @runway << plane
  end

  def take_off(plane)
    fail "Weather looks a bit mental best not to take off." if stormy?
    @runway.delete(plane)
    "#{plane} has buggered off."
  end

  attr_reader :runway
  attr_reader :capacity

  def full?
    @runway.length == @capacity
  end

  def stormy?
    rand(5) > 3
  end

end
