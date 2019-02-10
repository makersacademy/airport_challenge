require_relative "plane"
class Airport

  def land(plane)
    plane = Plane.new
    fail "plane landed" if plane.plane_flying? == false
    plane.plane_landed
  end

  def take_off(plane)
    plane = Plane.new
    plane.plane_flying?
  end
end
