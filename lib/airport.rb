require_relative "plane.rb"
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY=10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @plane = nil
  end

  def land_plane(plane)
    @plane = plane
  end

  def take_off
    raise RuntimeError, "No planes at the airport" unless @plane

    @plane = nil
    "Plane has taken-off"
  end
end
