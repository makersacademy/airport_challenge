require_relative 'aeroplane'

class Airport

attr_reader :plane

  def land(plane)
    plane.landed = true
    @plane = plane
  end

  def take_off(plane)
    plane.landed = false
    @plane = plane
  end


end
