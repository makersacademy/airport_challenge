require_relative "plane.rb"

class Airport
  def land(plane)
    @plane = plane
  end
  def plane
    @plane
  end
end