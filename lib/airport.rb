class Airport

  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    raise "This plane is already on the ground." if plane.landed?
    raise "Sorry, this airport is full." if full?
    raise "The weather at the airport is stormy, you cannot land." unless sunny?
    @planes << plane
    plane
  end

  def permit_takeoff(plane)
    raise "This plane is already in the air." unless plane.landed?
    raise "The weather at the airport is stormy, you cannot takeoff." unless sunny?
    raise "This plane is at a different airport" unless plane.landed_here?
    @planes.pop
    plane

  end

  def sunny?
    true
  end

  def full?
    planes.length >= capacity
  end

end
