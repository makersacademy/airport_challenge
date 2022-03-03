require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end 

  def land(plane)
    raise "Cannot land plane. Airport is full" if @planes.count >= capacity 
    raise "Cannot land plane due to stormy weather" if Weather.new.stormy?
    @planes << plane
  end

  def takeoff(_plane)
    raise "Cannot takeoff plane due to stormy weather" if Weather.new.stormy?
    @planes.pop
    "Plane has taken off"
  end
end
