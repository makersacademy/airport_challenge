require_relative './weather.rb'

class Airport
  attr_reader :planes, :capacity

  @@DEFAULT_CAPACITY = 10

  def initialize (capacity = @@DEFAULT_CAPACITY)
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

  def at_airport?(plane)
    # if plane is in the @planes array, return true, else return false
    @planes.include?(plane)
  end
end
