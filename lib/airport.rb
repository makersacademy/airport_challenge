class Airport 
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @airport = []
    @CAPACITY = capacity
  end

  def land(plane)
    @plane = plane
    fail "Airport is full" if @airport.size >= DEFAULT_CAPACITY
    @airport << @plane
  end

  def take_off(plane)
    @plane = plane
    @airport.delete(@plane)
    "Euston we have lift off"
  end

  def length
    @airport.length
  end

end