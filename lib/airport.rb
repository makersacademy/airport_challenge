require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes.push(plane)
  end

  def takeoff
    raise 'Takeoff postponed due to stormy weather' if Weather.now == 'stormy'

    @landed_planes.pop
  end
end
