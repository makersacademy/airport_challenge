# require_relative 'airplane'
require_relative 'airport'
require_relative 'weather'

class AirTrafficControl
  include Weather

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @inflight = []
    @capacity = capacity
  end

  def display_inflight
    @inflight.dup
  end

  def instruct_land(plane, airport)
    raise 'Too stormy to land' if stormy?
    raise 'Airport is full' if airport.full?
    plane.land
    @inflight.delete(plane)
  end

  def instruct_takeoff(plane, airport)
    @inflight << plane
  end

  private

end
