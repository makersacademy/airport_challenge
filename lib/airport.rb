require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize
    @plane = plane
  end

  def land(plane)
    plane.land?
  end

  def take_off(plane)
    plane.take_off?
  end

end
