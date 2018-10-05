require_relative 'airport'
class Plane

  attr_accessor :plane, :status

  def land(plane)
    plane.status = "parked"
  end

  def takeoff(plane)
    plane.status = "flying"
  end
end
