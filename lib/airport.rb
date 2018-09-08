require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :grounded_planes, :weather

  def initialize
    @grounded_planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Unable to land due to bad weather" if stormy?
    @grounded_planes << plane
  end

  def takeoff(plane)
    @grounded_planes.shift
    p "Plane has taken off"
    #p @grounded_planes = [] again
  end

  def stormy?
    weather.stormy?
  end
end
