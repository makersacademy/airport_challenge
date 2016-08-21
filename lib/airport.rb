require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
  end

  def takeoff(plane)
    fail 'It is too stormy to take off' if Weather.stormy?
    planes.delete(plane)
  end

  def full?
    return true if @planes.count >= 10
  end
end
