require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY, weather=Weather.new)
    @landed_planes = []
    @capacity = capacity
    @weather = weather
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
  attr_reader :landed_planes, :in_airport_status

  def full?
    landed_planes.count >= DEFAULT_CAPACITY
  end

  def landed?
    in_airport_status
  end

  def stormy?
    weather.weather_conditions
  end

end
