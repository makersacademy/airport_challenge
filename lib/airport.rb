class Airport
  DEFUALT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity=DEFUALT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full." if full?
    @planes << plane        
  end

  def take_off(plane)
    @planes.delete(plane)
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end
end