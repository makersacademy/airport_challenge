
class Airport

  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def order_landing(plane)
    raise 'Cannot land, airport full' if @planes.length == DEFAULT_CAPACITY
    plane.land(__id__)
    @planes.push(plane)
  end

  def order_takeoff(plane)

  end

end
