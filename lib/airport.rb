require_relative "plane"
class Airport

  def land(plane)
    plane = Plane.new
    plane.plane_landed
  end
end
