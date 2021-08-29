class Airport

  attr_accessor :planes, :capacity

  def initialize
    @planes = []
    @capacity = 5
  end

  def land(plane)
    fail "Airport is full" if @planes.size >= @capacity
    
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

end
