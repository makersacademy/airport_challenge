require_relative "plane.rb"

class Airport
  attr_accessor :planes
  def initialize()
    @planes = []
  end
  def allows_landing(plane)
    planes << plane
    "Aircraft #{plane} has landed"
  end
  def allows_takeoff
    "Aircraft #{@planes.pop} has departed"
  end
end
