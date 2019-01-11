require "plane"

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def verify_takeoff(plane)
    !planes.include?(plane)
  end
end
