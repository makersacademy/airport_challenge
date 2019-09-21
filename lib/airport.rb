require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes, :stormy

  def initialize(weather)
    @planes = []
    @stormy = weather.stormy?
  end

  def land_plane(plane)
    @planes << plane
  end

  def takeoff
    raise "Weather is too stormy to takeoff" if (stormy == true)
    @planes.pop
  end

end
