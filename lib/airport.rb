require_relative 'plane'

class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @grounded_planes = []
  end

  def land(plane)
    fail "Cannot land anymore plane, airport is full." if @grounded_planes.count >= @capacity 
    @grounded_planes << plane
  end

  def take_off(plane)
    plane
  end

end