require_relative 'plane'

class Airport

  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Airport is full" if airport_full?
    @planes << plane
    plane
  end

  def airport_full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  def takeoff(plane)
    raise "Plane cannot takeoff because it is not in the airport" if !@planes.include?(plane)
    @planes.delete(plane)
    plane
  end

end
