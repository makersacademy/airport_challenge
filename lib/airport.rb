require_relative 'plane'


class Airport

  attr_reader :planes
  attr_reader :capacity


  def initialize
    @planes = []
    @capacity
  end

  def land_plane(plane)
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
