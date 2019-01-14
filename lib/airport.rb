require 'weather'

class Airport
  attr_reader :planes, :capacity
  attr_writer :capacity

  def initialize
    @capacity = 1
    @planes = []
  end

  def land(plane)
    raise 'Cannot Land: Turbulent Weather' if stormy?
    raise 'Cannot Land: Airport Full' if full?

    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot Take Off: Turbulent Weather' if stormy?
    raise 'Cannot Take Off: Plane Not Found' unless plane_here? plane

    @planes.delete(plane)
  end

  private

  def stormy?
    Weather.current == "stormy"
  end

  def full?
    @planes.length >= @capacity
  end

  def plane_here?(plane)
    @planes.include? plane
  end
end
