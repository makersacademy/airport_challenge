require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :weather, :capacity

  def initialize
    @planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACITY
  end

  def get_plane
    Plane.new
  end

  def plane=(plane)
    @plane = plane
  end

  def weather=(weather)
    @weather = weather
  end

  def set_weather(weather)
    self.weather=(weather)
  end

  def land(plane)
    fail 'Planes cannot land while it is stormy' if stormy?
    fail 'Planes cannot land at this airport, it is full' if full?
    @planes << plane
  end

  def take_off(plane)
    fail 'Planes cannot take off while it is stormy' if stormy?
    @planes.delete(plane)
  end

  def stormy?
    weather.condition == :stormy
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
