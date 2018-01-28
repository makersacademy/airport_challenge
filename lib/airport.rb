require_relative "weather"
require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail " Airplane is not allowed to land due to stormy weather" if storm?
    # fail " Airplane is allowed to land due to clear weather" if clear?
    fail "Airplane is not allow to land, Airport is full" if full?
    @hangar << plane
    "Plane has landed"

  end

  def take_off(plane)
    fail "Airplane is not allowed to take off due to stormy weather" if storm?
    @hangar.delete(plane)
    "Plane has taken off"
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  def storm?
    @weather.random_weather == "storm"
  end

  # def clear?
  #   @weather.random_weather == "clear"
  # end
end
