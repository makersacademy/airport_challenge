class Airport 
  # attr_accessor :plane

  def initialize 
    @airport = []
    @CAPACITY = 5
  end

  def land(plane)
    @plane = plane
    fail "Airport is full" if @airport.length > @CAPACITY
    @airport << @plane
  end

  def take_off(plane)
    @plane = plane
    @airport.delete(@plane)
    "Euston we have lift off"
  end

end