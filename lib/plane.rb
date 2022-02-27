require './lib/airport'
require './lib/weather'

class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    fail "Unable to land due to the weather" if stormy?
    fail "Airport is full." if airport.full?
    @flying = false if airport.receive(self)
  end

  def take_off(airport)
    fail "Unable to take off due to the weather" if stormy?
    @flying = true if airport.release(self)
  end

  def flying?
    @flying
  end

  private

  def check_weather
    current_weather = Weather.new
    current_weather.conditions
  end

  def stormy?
    check_weather == "Stormy"
  end
  
end