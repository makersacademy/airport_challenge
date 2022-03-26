require_relative './airport'

class Plane
  attr_reader :location

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
    @location = :in_air
    self
  end
end
