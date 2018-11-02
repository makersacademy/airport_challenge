require_relative 'weather'

class Airport
  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
  end

  def land(plane)
    fail 'it is too stormy to land' if @weather.stormy?
    @planes.push(plane)
  end

  def takeoff(plane)
    fail 'it is too stormy to take off' if @weather.stormy?
    @planes.delete(plane)
    "#{plane} has taken off"
  end
end
