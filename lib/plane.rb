require_relative './airport'

class Plane

  attr_accessor :location

  def initialize
    @location = nil
  end

  def land(airport)
    fail "Plane can't land. Airport is full" if airport.full?
    @location = airport
    airport.planes.push(self)
  end

  def take_off(airport)
    @location = "enroute"
  end
end