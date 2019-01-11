require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
    self
  end

  def take_off_plane(plane, weather = Weather.new)
    fail "can't take off due to storms" if check_weather(weather) == "stormy"

    @planes.delete(plane)
    self
  end

  def check_weather(weather)
    weather.condition
  end

end
