class Airport

  attr_reader :capacity

  def initialize
    @capacity = 5
  end

  def set_capacity(new_capacity)
    fail "Capacity must be greater than 0" if new_capacity <= 0
    @capacity = new_capacity
  end

end

# airport = Airport.new
# airport.set_capacity(-5)