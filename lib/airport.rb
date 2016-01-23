
require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :planes, :weather

  def initialize(weather=Weather.new)
    @planes = []
    @weather = weather
  end

  def land plane
    planes << plane
    "#{plane} has landed"
  end

  def takeoff plane
    fail "Storm!Takeoff is not allowed!" if weather.stormy?
    planes.delete(plane)
    "#{plane} has taken off"
  end

end