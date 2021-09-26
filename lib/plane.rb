require_relative "airport"
require_relative "weather"
require "rspec"

class Plane
  def initialize
    @airport = nil
    @weather = Weather.new
  end

  def land(airport)
    fail "Weather is stormy" if @weather.stormy?
    fail "Airport is full" if airport.full?
    fail "Already landed" if !flying?
    @airport = airport
    @airport.plane_landed
  end

  def takeoff
    fail "Weather is stormy" if @weather.stormy?
    fail "Already took off" if flying?
    @airport = nil
  end

  def in_airport?(airport)
    @airport == airport
  end

  private

  def flying?
    @airport == nil
  end
end
