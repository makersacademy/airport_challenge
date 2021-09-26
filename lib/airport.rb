require 'weather'

class Airport
  attr_reader :capacity, :planes, :weather

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport full' if full?
    @planes << plane
  end

  def takeoff
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
