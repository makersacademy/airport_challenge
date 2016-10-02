class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'This plane has already landed' if planes.include?(plane)
    fail 'This airport can\'t receive more planes' if full?
    plane.land
    planes.push(plane)
  end

  def take_off(plane)
    fail 'This plane has not landed yet' unless planes.include?(plane)
    plane.take_off
    planes.delete(plane)
  end

  def full?
    planes.length >= capacity
  end
end
