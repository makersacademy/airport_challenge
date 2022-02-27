require './lib/airport'
require './lib/weather'

class Plane

  def initialize
    @flying = true
    @airport = nil
  end

  def land(airport)
    fail "This plane is already at an airport" unless flying?
    fail "Unable to land due to the weather" if stormy?
    fail "Airport is full." if airport.full?
    airport.receive(self)
    @airport = airport
    @flying = false
  end

  def take_off
    fail "This plane is not in an airport" if flying?
    fail "Unable to take off due to the weather" if stormy?
    @airport.release(self)
    @airport = nil
    @flying = true
  end

  def flying?
    @flying
  end

  def check_weather
    current_weather = Weather.new
    current_weather.conditions
  end

  private

  def stormy?
    check_weather == "Stormy"
  end
end
