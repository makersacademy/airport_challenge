require 'plane.rb'

class Airport

  def intialize
    @plane
  end

  def land(plane)
    @plane = plane
  end

  def take_off
    Plane.new
  end

end
