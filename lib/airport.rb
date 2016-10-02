require_relative './plane'

class Airport
  attr_accessor :planes, :weather

  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
  end

  def land(plane)
    @planes << plane
    "#{plane} has landed"
  end

  def takeoff(plane)
    @planes.delete(plane)
    "#{plane} has taken off"
  end

end
