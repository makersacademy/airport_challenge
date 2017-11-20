require_relative 'plane'
require_relative 'weather'

# manages landing and leaving planes. Takes information from Weather class to
# decide whether a plane should land or take off.
class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane, weather)
    raise 'Landing denied due to stormy weather' if weather.stormy?
    @planes << plane.land
  end

  def take_off(plane, weather)
    raise 'Take-off denied due to stormy weather' if weather.stormy?
    plane.take_off
  end
end
