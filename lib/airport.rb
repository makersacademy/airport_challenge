require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_land(plane)
    fail 'Plane has already landed' if @planes.include?(plane)
    fail 'Airport is full' if full?
    @planes << plane
    return 'Plane is landed'
  end

  def plane_take_off(plane)
    fail 'Airport is empty' if empty?
    @planes.pop
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
