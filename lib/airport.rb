class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
   raise 'Airport is full' if full?
   raise 'Not safe, it is stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Not safe, it is stormy' if stormy?
    @planes.pop
    return "plane no longer in the airport"
  end

  def full?
  @planes.length >= @capacity
end

  def stormy?
    rand(1..5) > 3
  end

end
