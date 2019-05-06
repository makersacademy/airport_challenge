require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new.weather
  end

  def land(plane)
    land_guards(plane)
    plane.landed
    planes << plane
  end

  def land_guards(plane)
    raise "Airport full" if planes.length >= capacity
    raise "Too stormy to land right now" if weather == "stormy"
    raise "Plane already at the airport!" if planes.include?(plane)
    raise "Plane already at another airport" if plane.airborne == false
  end

  def take_off(plane)
    take_off_guards(plane)
    planes.delete(plane)
    plane.taken_off
    planes
  end

  def take_off_guards(plane)
    message = "Specified plane at another airport"
    raise message if plane.airborne == false && !planes.include?(plane)
    raise "Plane already airborne" if plane.airborne == true
    raise "Too stormy to take off right now" if weather == "stormy"
  end
end
