require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Unable to land" if @planes.length >= @capacity
    @planes << plane
  end

  def takeoff_plane
    @planes.pop
  end
end
