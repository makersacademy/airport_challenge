require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane, weather)
    fail 'Cannot land. Stormy weather.' if weather.is_stormy
    fail 'Cannot land. Plane has already landed.' if landed(plane)
    plane.landplane
    @planes << plane
  end

  def takeoff(plane, weather)
    fail 'Cannot instruct takeoff. Stormy weather.' if weather.is_stormy
    fail 'Cannot instruct takeoff. Plane is already flying.' if plane.flying
    plane.takeoff_plane
    @planes.delete(plane)
  end


private

  def landed(plane)
    !plane.flying
  end

end
