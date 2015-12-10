class Airport
  attr_reader :planes, :capacity

  def initialize(capacity)
    @planes   = []
    @capacity = 20
  end

  def land(plane)
    raise"Sorry mate- the airport is full" if planes.length >= capacity
    @planes << plane
  end

  def take_off(plane)
  end
end
