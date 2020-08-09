require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather_conditions

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather_conditions = Weather.new.weather
  end

  def land(plane)
    fail "Airport is full" if full?

    fail "This plane has already landed" if landed? plane

    fail "Unable to land due to stormy weather" if stormy?

    plane.set_as_landed
    planes << plane
  end

  def take_off
    fail "No planes are at the airport" if empty?

    fail "Unable to take off due to stormy weather" if stormy?

    planes[-1].set_as_flying
    planes.pop
  end

  def weather_update
    @weather_conditions = Weather.new.weather
  end

  private

  def full?
    planes.count >= capacity
  end

  def landed?(value_to_check)
    value_to_check::flying == false
  end

  def empty?
    planes.empty?
  end

  def stormy?
    weather_conditions == "stormy"
  end
end
