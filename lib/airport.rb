require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  def plane_take_off
    fail 'No Planes at the airport' if empty?
    planes.pop
  end
  def plane_land(plane)
    fail 'Airport is full' if full?
    planes << plane
  end
  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
