require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  DEFAULT_WEATHER = "fine"

  attr_reader :hangar
  attr_accessor :capacity
  attr_accessor :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end
  def land(plane)
    fail "The hanger is full, planes cannot land." if full?
    fail "The weather is stormy, planes cannot land." if stormy_weather?
    hangar << plane
  end
  def takeoff(plane)
    fail "The weather is stormy, planes cannot take off." if stormy_weather?
    hangar.delete(plane)
    "The plane has taken off."
  end
  def full?
    hangar.length >= capacity
  end
  def stormy_weather?
    weather == "stormy"
  end
end