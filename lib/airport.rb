require_relative 'plane'

class Airport

  def land(plane) #creating a new method to land a plane
    @plane = plane
  end

  def take_off
    Plane.new #creating a new instance of the plane class to take off
  end

end
