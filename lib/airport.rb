require_relative './plane'

class Airport
  attr_accessor :planes, :capacity

  def initialize
    @planes = []
    @capacity = 30
  end

  def land(plane)
    raise "Airport is full" if full?
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end

private

  def full?
    @planes.length >= @capacity
  end

end
