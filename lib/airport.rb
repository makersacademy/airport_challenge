require './lib/plane'
require './lib/weather'

class Airport

include Weather

  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def new_capacity=(capacity)
    @capacity = capacity
  end

  def land(plane)
    fail "It is stormy" if stormy?
    fail "This airport is full" if full?
    fail "This plane is landed" if plane.flying == false
    @planes << plane
  end

  def takeoff(_plane)
    fail "It is stormy" if stormy?
    @planes.pop
  end

  private

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

end
