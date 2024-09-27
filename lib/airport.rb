require_relative 'plane'

class Airport

  DEF_CAPACITY = 20

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    fail "Weather looks a bit mental best find somewhere else to land." if stormy?
    fail "Go away. Airport is full." if full?
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
