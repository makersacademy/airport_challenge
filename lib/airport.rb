require_relative 'plane'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "This plane has already landed" if @planes.include?(plane)

    raise "Airport full! You cannot land here!" if @planes.count >= @capacity

    @planes << plane
  end

  def takeoff(plane)
    raise "Conditions are too risky to fly. Stay grounded!" if stormy?
    @planes -= [plane]
  end

  def stormy?
    rand(1..10) > 8
  end

end
