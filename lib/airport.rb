require_relative 'planes'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(a_plane)

    @planes.push(a_plane)
  end

  def take_off(a_plane)
    raise 'The plane cannot take-off because of stormy weather' if @weather.stormy? 
    @planes.delete(a_plane)
  end

  def landed_planes
    @planes
  end

end
