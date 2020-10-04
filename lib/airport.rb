class Airport

  attr_reader :plane
  attr_reader :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full!" if @planes.count == @capacity
    
    plane.land
    @planes << plane
    
  end

  def take_off
    @planes[0].take_off
    @planes.delete_at(0)
  end

end
