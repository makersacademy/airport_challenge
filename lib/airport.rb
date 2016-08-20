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
    fail "That plane has already landed." if planes.include?(plane)
    planes.push(plane)
    plane.has_landed
  end

  def takeoff(plane, weather)
    update_conditions(weather)
    fail "Stormy weather! It's too dangerous to takeoff right now." if weather.stormy
    fail "That plane is already flying" if flying(plane)
    fail "That plane is not in this airport" if planes.include?(plane) == false
    planes.delete(plane)
    plane.is_flying
  end

  def full?
    planes.count >= capacity
  end

  def flying(plane)
    plane.flying
  end

  def update_conditions(weather)
    weather.random_weather
  end

end
