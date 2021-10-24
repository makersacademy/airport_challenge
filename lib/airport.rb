class Airport
  def initialize(capacity = 20)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full
    @planes << plane
  end
  def take_off(plane)
    raise "Cannot take off plane: weather is stormy" if stormy
  end
end

private
def full
  @planes.length >= @capacity
end

def stormy
  rand(1..10) > 7
end
  
  