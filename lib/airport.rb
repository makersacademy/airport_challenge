require 'plane.rb'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Unable to land due to full airport' if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
    @planes
  end

  def full?

  end
end
