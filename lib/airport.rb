require_relative 'plane'

class Airport

  attr_reader :plane

  def landing(plane)
    @plane = plane
    @plane.landed = true
  end

  def take_off(plane)
    @plane = plane
    @plane.landed = false
  end


end
