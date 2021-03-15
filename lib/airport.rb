require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :plane, :weather
  attr_accessor :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def planes_at_airport
    @planes
  end

  def land(plane)
    fail 'Airport full' if airport_full
    fail 'The weather is too stormy' if stormy_weather(weather) == true
    fail 'Plane not flying' if plane.flying == false

    @planes.append(plane)
    plane_state_change(plane)
  end

  def take_off(plane)
    fail 'The weather is too stormy' if stormy_weather(weather) == true
    fail 'Plane already flying' if plane.flying == true

    @planes.delete(plane)
    plane_state_change(plane)
    "Plane #{plane} has taken off."

  end

  def airport_full
    @planes.count >= capacity
  end

  def stormy_weather(weather)
    return true if weather.stormy?
  end

  def plane_state_change(plane)
    plane.flying == true ? plane.flying = false : plane.flying = true
  end
end
