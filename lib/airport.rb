
class Airport

  attr_reader :planes, :capacity

  def initialize(capacity=3)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    raise 'Plane already landed' unless plane.location == 'airborne'
    raise 'The airport is full.' unless @planes.length < @capacity
    @planes << plane
    plane.location = self
  end

  def take_off(plane)
    raise 'You are not at this airport' unless @planes.include? plane
    plane.location = 'airborne'
    @planes.delete(plane)
  end

end