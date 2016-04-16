require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land_plane(plane)
    fail "Too stormy for landing" if @weather.stormy?
    plane.landed?
    @planes << plane
    "The plane has landed"
  end

  def take_off(plane)
    fail "Too stormy for take-off" if @weather.stormy?
    plane.flying
    @planes.delete(plane)
  end

end
