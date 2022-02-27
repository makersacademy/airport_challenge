require './lib/airport'
require './lib/weather'

class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    fail "This plane is already at an airport" unless flying?
    fail "Unable to land due to the weather" if stormy?
    fail "Airport is full" if airport.full?
    @flying = false
    airport.hangar << self
  end

  def take_off(airport)
    fail "This plane is not at an airport" if flying?
    fail "Unable to take off due to the weather" if stormy?
    fail "This plane is not at this airport" unless plane_at?(airport)
    @flying = true
    airport.hangar.delete(self)
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

  def plane_at?(airport)
    airport.hangar.include?(self)
  end
end
