require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity= DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Unable to land, the airport is full' if airport_full?
    fail 'Unable to land due to storm' if stormy?
    planes << plane
  end

  def takeoff
    fail 'Unable to take off due to storm' if stormy?
    planes.pop
  end
  
  private

  def airport_full?
    planes.count >= capacity
  end

end
