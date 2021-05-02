class Airport
  DEFUALT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity=DEFUALT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Cannot land due to bad weather" if stormy?
    @planes << plane        
  end

  def take_off(plane)
    raise "Cannot take off due to bad weather" if stormy?
    @planes.delete(plane)
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end