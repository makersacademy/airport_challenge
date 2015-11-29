require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Cannot land. Plane has already landed.' if landed(plane)
    plane.landplane
    @planes << plane
  end

  def takeoff
    @planes.pop
  end


private

  def landed(plane)
    !plane.flying
  end

end
