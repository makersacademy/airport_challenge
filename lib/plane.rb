require_relative "airport"
require_relative "weather"
require "rspec"

class Plane
  def initialize
    @airport = nil
    @weather = Weather.new
  end

  def land(airport)
    fail "Airport is full" if airport.full?
    @airport = airport
    @airport.plane_landed
  end

  def takeoff
    fail "Weather is stormy" if @weather.stormy?
    @airport = nil
  end

  def in_airport?(airport)
    @airport == airport
  end
end
