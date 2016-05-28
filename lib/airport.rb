require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise("Airport full") if @planes.length >= @capacity
    @planes << plane
  end

  def takeoff
    raise("Airport empty") if @planes == []
    @planes.pop
  end
end