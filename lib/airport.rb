require './lib/plane.rb'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Cannot land while stormy' if stormy?

    fail 'Airport is full' if full?

    fail 'Plane already landed' if @planes.include?(plane) == true
    
    @planes << plane
  end

  def takeoff(plane)
    fail 'Cannot take-off while stormy' if stormy?

    fail 'Plane not at this airport' if @planes.include?(plane) == false

    @planes.delete(plane)
  end

  def full?
    true if @planes.length == @capacity
  end

  def stormy?
    rand(1..5) == 3
  end
end
