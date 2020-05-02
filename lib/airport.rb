require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
    "#{plane} landed at airport"
  end

  def take_off
    @landed_planes.pop
    Plane.new
  end
end
