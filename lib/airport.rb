require './lib/plane'

class Airport

  attr_reader :planes, :capacity
  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    fail "Bad weather for landing" if stormy?
    @planes << plane
  end

  def take_off
    raise "airport is empty" if empty?
    raise "Bad weather for take off" if stormy?
    @planes.pop
  end

  def stormy?
    rand(100) > 80
  end

private

  def full?
    @planes.length == capacity
  end

  def empty?
    @planes.empty?
  end

end
