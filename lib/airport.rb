require_relative './weather'

class Airport
  attr_reader :planes, :capacity

  @@default_capacity = 10

  def initialize(capacity = @@default_capacity)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather = plane.weather)
    fail 'Airport is full.' if @planes.length >= capacity 
    fail 'Safety: unable to land due to storm.' if weather.stormy?
    @planes << plane
  end

  def takeoff(plane, weather = plane.weather)
    fail 'Safety: unable to takeoff due to storm.' if weather.stormy?
    @planes.delete(plane)
  end

  def at_airport?(plane, _airport)
    @planes.include? plane
  end
end
