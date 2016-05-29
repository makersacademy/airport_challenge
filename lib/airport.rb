class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(params = {})
    @planes = []
    @storm_probability = params.fetch(:storm_probability, 10) # 10%
    @capacity = params.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def arrive(plane)
    fail "Airport is full!" if full?
    fail "Plane can't land due to stormy weather." if stormy?
    @planes << plane
    plane.land(self)
  end

  def depart(plane)
    fail "Plane can't take off due to stormy weather." if stormy?
    @planes.delete(plane)
    plane.take_off
  end

  private

  def stormy?
    chance = rand(101)
    chance <= @storm_probability ? true : false
  end

  def full?
    @planes.count >= capacity
  end

end
