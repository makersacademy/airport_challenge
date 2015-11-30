require_relative 'plane'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @weather_condition = rand(1..5)
    @capacity = capacity
  end

  def instruct_to_land(plane)
    fail "No planes can land as it is stormy" if stormy?
    fail "The plane is already in the airport" if landed?
    fail "The airport is full, so no more planes can land" if full?
    landed_planes << plane
    plane.land
  end

  def instruct_take_off(plane)
    fail "No planes can take off as it is stormy" if stormy?
    fail "There are no planes in the airport" if landed_planes == []
    plane.take_off
    landed_planes.delete(plane)
  end

  private
  attr_reader :landed_planes

  def full?
    landed_planes.count >= DEFAULT_CAPACITY
  end

  def landed?
    @in_airport_status
  end

end
