require_relative "plane"

class Airport

  attr_reader :plane

  def initialize()
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if @planes.count >= 10
    @planes.push(plane)
  end

  def take_off
    fail "Plane has taken off" if @planes.empty?
    @plane.pop
  end

end