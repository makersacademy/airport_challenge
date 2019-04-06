require_relative "plane"
class Airport
  def land
    Plane.new
  end

  def airport(plane)
    @plane = plane
end
end
