require_relative  "plane.rb"

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end
  def land(plane)
    @planes << plane
    plane.has_landed = true
  end
end
