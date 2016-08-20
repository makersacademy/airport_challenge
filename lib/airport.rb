require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    update_conditions(weather)
    fail "Stormy weather! It's too dangerous to land right now." if weather.stormy
    fail "Can't land! This airport is full ..." if full?
    planes.push(plane)
  end

  def takeoff(plane, weather)
    update_conditions(weather)
    fail "Stormy weather! It's too dangerous to takeoff right now." if weather.stormy
    planes.delete(plane)
  end

  def full?
    planes.count >= capacity
  end

  def update_conditions(weather)
    weather.random_weather
  end

end
