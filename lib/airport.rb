require './lib/weather'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def conditions
    weather.conditions
  end

  def dock_plane(plane)
    plane.land
    planes << plane
  end

  def release_plane(plane)
    plane.take_off
    planes.delete(plane)
  end

end
