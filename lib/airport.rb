require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if full?
      raise RuntimeError, "Airport full"
    else
      @planes.push(plane)
    end
  end

  def takeoff(plane)
    if @planes.include?(plane)
      @planes -= [plane]
    else
      raise RuntimeError, "Plane #{plane} not at airport"
    end
  end

  private

  def full?
    @planes.length >= @capacity
  end
end
