require_relative 'plane'

class Airport 
  attr_reader :planes
  DEFAULT_CAPACITY = 10
  PLANES_LANDING = 3
  PLANES_TAKEOFF = 2

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Airport is full' if full?
    raise 'Too stormy to land' if stormy?
    
    @planes << plane
  end

  def takeoff(*)
    raise 'Too stormy to takeoff' if stormy?

    @planes.pop
  end

  def no_longer_in_airport(plane)
    @planes.include?(plane) ? "The plane is in the airport" : "The plane has left the airport"
  end

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
    rand(1..100) > 75
  end
end
