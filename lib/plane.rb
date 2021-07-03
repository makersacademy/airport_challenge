require_relative './airport'

class Plane

  attr_accessor :location

  def initialize
    @location = nil
  end

  def land(airport)
    fail "Plane can't land. Airport is full" if airport.full?

    fail "Plane can't land in stormy weather" if airport.weather == "stormy"

    @location = airport
    airport.planes.push(self)
  end

  def take_off(airport)
    fail "Plane can't take off in stormy weather" if airport.weather == "stormy"

    fail "Plane not at this airport" if airport != location

    @location = "enroute"
  end
end
