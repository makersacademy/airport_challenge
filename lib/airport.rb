require_relative 'plane'

class Airport
  attr_reader :airplanes, :capacity

  MAXIMUM_CAPACITY = 20

  def initialize(capacity = MAXIMUM_CAPACITY)
    @airplanes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Airport full" if airport_full?
    @airplanes << plane
  end

  def take_off
    @airplanes.pop
  end

  def airport_full?
    @airplanes.length == @capacity
  end
end
