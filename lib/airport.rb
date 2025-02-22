class Airport

  attr_reader :plane 
  attr_accessor :capacity

  DEFAULT_CAPACITY = 25

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full, landing prevented" if full?

    @planes << plane
  end

  def take_off(_plane)
    @planes.pop
  end

  def confirmation
    "Plane has left the airport"
  end

  private 

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

 

end
