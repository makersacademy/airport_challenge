require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 3
  attr_reader :planes, :stormy, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = false
    @capacity = capacity
  end

  def report_stormy
    @stormy = true
  end

  def take_off
    raise 'Sorry, no taking off in stormy weather' if stormy == true
    planes.pop
  end

  def land(plane)
    raise 'Sorry, no landing in stormy weather' if stormy == true
    raise 'Sorry, the airport is full' if planes.count == capacity
    planes << plane
  end
end
