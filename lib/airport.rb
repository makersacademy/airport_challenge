require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :weather

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "Plane has already landed" unless plane.airborne?
    plane.instance_variable_set(:@airborne, false)
    @planes << plane
  end

  def take_off(plane)
    fail "Stormy weather" if weather.stormy?
    fail "Plane has already taken off" if plane.airborne?
    plane.instance_variable_set(:@airborne, true)
    @planes.delete(plane)
    @planes
  end

end
