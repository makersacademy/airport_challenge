require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land_plane(plane)
    plane.landed?
    @planes << plane
    "The plane has landed"
  end

  def take_off(plane)
    fail "Too stormy to take-off" if @weather.stormy?
    plane.flying?
    @planes.pop
  end

end
