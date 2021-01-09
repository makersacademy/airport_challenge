require_relative "plane"

class Airport

  attr_reader :plane

  def initialize()
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full
    @planes.push(plane)
  end

  def take_off
    fail "Plane has taken off" if empty
    @plane.pop
  end

  private

  def empty
    @planes.empty?
  end

  def full
    @planes.count >= 10
  end

end