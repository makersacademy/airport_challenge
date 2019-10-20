require_relative 'plane.rb'
require_relative 'weather'

class Airport
  attr_reader :landed_planes
  attr_reader :weather
  attr_reader :capacity

  def initialize
    weather = Weather.new
    @landed_planes = []
    @weather = weather.report
  end

  def land(plane)
    raise "Plane already landed." if plane.flying == false
    raise "To stormy to land." if weather == "stormy"

    @landed_planes << plane
    plane.landed
  end

  def takeoff(plane)
    raise "To stormy to take off." if weather == "stormy"

    @landed_planes.delete(plane)
    "Plane safely taken off."
  end

end
