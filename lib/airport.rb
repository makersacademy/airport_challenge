require_relative 'plane'


class Airport

  attr_reader :planes
  attr_reader :capacity

  DEAFAULT_CAPACITY = 10

  def initialize(capacity = DEAFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Airport is full" if @planes.count >= DEAFAULT_CAPACITY
    @planes << plane
    plane
  end

  def in_airport?(plane)
    return true if @planes.include?(plane)
    false
  end

  def takeoff(plane)
    @planes.delete(plane)
    plane
  end

end
