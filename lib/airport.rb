require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Cannot land. Stormy weather.' if badweather?
    fail 'Cannot land. Plane has already landed.' if landed(plane)
    plane.landplane
    @planes << plane
  end

  def takeoff(plane)
    fail 'Cannot instruct takeoff. Stormy weather.' if badweather?
    fail 'Cannot instruct takeoff. Plane is already flying.' if plane.flying
    plane.takeoff_plane
    @planes.delete(plane)
  end


  def badweather?
    true
  end

private

  def landed(plane)
    !plane.flying
  end


end
