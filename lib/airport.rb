require_relative "plane.rb"
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY=10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    raise RuntimeError if @planes.count >= @capacity
    @planes << plane
  end

  def take_off
    raise RuntimeError, "No planes at the airport" if @planes.count < 1

    @planes.pop
    "Plane has taken-off"
  end
end
