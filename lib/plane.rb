require_relative './airport'

class Plane

  def initialize
    @location = :in_air
  end

  def land(airport)
    airport.hangar.push(self)
    @location = airport
    self
  end

  def take_off
    raise "Already in the air" if @location == :in_air
    @location.hangar.delete(self)
    self
  end
end
