require_relative 'airport'

class Plane

  attr_reader :location

  def initialize(location = "airborne")
    @location = location
  end

  def land_at(airport)
    airport.receive(self)
    @location = airport.name
  end

  def take_off_from(airport)
    airport.send(self)
    @location = "airborne"
  end

end
