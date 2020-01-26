require_relative "plane.rb"

class Airport
  def land(plane)
    plane
  end
  def plane
    Plane.new
  end
end