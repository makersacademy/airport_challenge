class Airport

  attr_reader :capacity
  attr_reader :planes

  def initialize
    @capacity = 5
    @planes = []
  end

  def set_capacity(new_capacity)
    return "Capacity must be greater than 0" if new_capacity <= 0
    @capacity = new_capacity
  end

  def accept_plane(plane)
    return "Airport already at capacity" if @planes.length >= @capacity
    @planes << plane
    true
  end

end

# airport = Airport.new
# airport.set_capacity(-5)