require_relative "plane"

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
    @weather = (rand(3) == 2 ? :stormy : :clear)
  end

  def verify_takeoff(plane)
    # Returns true if plane not at airport and false if plane at airport
    !planes.include?(plane)
  end
end
