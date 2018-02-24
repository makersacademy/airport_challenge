require_relative '../lib/plane'

class Airport
  # controls instances of Airport including landing, takeoff
  attr_reader :landed_planes

  def initialize
    # create landed_planes array empty
    @landed_planes = []
  end

  def land(plane)
    # do not let plane land if stormy
    raise 'Too stormy to land' if weather > 8
    # land a plane by adding it to the landed_planes
    @landed_planes << plane
  end

  def takeoff(plane)
    # do not let plane takeoff if stormy
    raise 'Too stormy to takeoff' if weather > 8
    # takeoff a plane by removing it from the landed_planes
    # return landed_planes to confirm the plane is no longer in the array
    @landed_planes.delete(plane)
    @landed_planes

  end

  def weather
    rand(1..10)
  end
end
