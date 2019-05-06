require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Plane landing is delayed due to stormy weather" if weather.stormy?

    @planes << plane
    return "#{plane} has landed"
  end

  def take_off(plane)
    fail "All planes are grounded!" if weather.stormy?

    @planes.delete(plane)
    return "#{plane} has taken off"
  end
end
