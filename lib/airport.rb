require_relative "plane"

class Airport

  attr_reader :plane

  def initialize()
    @plane = plane
  end

  def land(plane)
    @plane = plane
  end

  def take_off
    fail "Plane has taken off" unless @plane
    @plane
  end

end