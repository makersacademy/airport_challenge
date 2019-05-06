require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :planes, :weather
  def initialize
    @planes = []
    @weather = Weather.new.weather
  end

  def land(plane)
    raise "Too stormy to land right now" if weather == "stormy"
    raise "Plane already at the airport!" if planes.include?(plane)

    planes << plane
  end

  def take_off(plane)
    raise "Too stormy to take off right now" if weather == "stormy"
    raise "Specified plane not at this airport" if !planes.include?(plane)

    planes.delete(plane)
    planes
  end
end
