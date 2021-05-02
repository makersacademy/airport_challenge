class Airport

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end 

  def land(plane)
    fail 'The airport is full.' if full?
    fail 'Cannot land - it is stormy.' if stormy?
    
    @landed_planes.push(plane)
  end

  def take_off(plane)
  end 

  private

  def full?
    @landed_planes.count >= @capacity
  end 

  def stormy?
    rand(1..10) > 7
  end
end
