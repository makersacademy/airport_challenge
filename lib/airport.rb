require_relative 'plane'
require_relative 'weather'

class Airport

  def land
    plane = Plane.new
    plane
  end

  def take_off
    plane = Plane.new
    plane.landed = false
    plane
  end

end
