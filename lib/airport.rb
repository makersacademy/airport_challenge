require_relative "../lib/plane.rb"
require_relative "../lib/weather.rb"

class Airport

attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Plane already landed" if planes.include?(plane)
    plane.land
    planes << plane
  end

  def take_off(plane)
    raise "Plane cannot take off due to stormy weather" if weather.stormy?
    raise "Plane not in airport" if !planes.include?(plane)
    @planes.delete(plane)
  end

end
