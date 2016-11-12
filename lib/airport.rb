require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane, :weather

  def initialize
    @weather = Weather.new
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
    fail 'Planes cannot land while it is stormy' if self.weather.condition == :stormy
    self.plane=(plane)
  end

  def take_off_plane
    fail 'Planes cannot take off while it is stormy' if self.weather.condition == :stormy
    self.plane=(nil)
  end

end
