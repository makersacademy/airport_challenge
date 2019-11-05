require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if @planes.length < @capacity
      @planes.push(plane)
    else
      raise RuntimeError, "Airport full"
    end
  end

  def takeoff(plane)
    if @planes.include?(plane)
      @planes -= [plane]
    else
      raise RuntimeError, "Plane #{plane} not at airport"
    end
  end
end
