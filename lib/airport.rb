require_relative "plane.rb"

class Airport
  attr_reader :planes
  def land(plane)
    @planes = plane
  end
  def take_off(plane)
    @planes = nil
  end
end