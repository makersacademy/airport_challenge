require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_take_off
    fail 'Airport is empty' if empty?
    planes.pop
  end

  def plane_land(plane)
    fail 'Airport is full' if full?
    planes << plane
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end
