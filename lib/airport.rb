class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'Airport is full' if full?
    @airport << plane
  end

  def take_off
  end

  private 

  attr_reader :airport

  def full?
    airport.length >= capacity
  end
end
