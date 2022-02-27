require './lib/airport'
require './lib/weather'

class Plane

  def initialize
    @flying = true
    @airport = nil
  end

  def land(airport)
    fail "Unable to land due to the weather" if stormy?
    fail "Airport is full." if airport.full?
    @flying = false if airport.receive(self)
    @airport = airport

  end

  def take_off
    fail "Unable to take off due to the weather" if stormy?
    @flying = true if @airport.release(self)
    @airport = nil
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
