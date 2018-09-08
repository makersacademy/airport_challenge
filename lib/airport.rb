
class Airport
  def takeoff
    Plane.new
    "Plane departed."
  end

  def land(plane)
    @plane = plane
    "Plane landed."
  end
end
