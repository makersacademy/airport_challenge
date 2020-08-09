require_relative 'plane'

class Airport

  def land(plane)
    @plane = plane
    plane.landed
    @plane
  end

  def take_off
    @plane.flying
    @plane
  end

  attr_reader :plane

end
