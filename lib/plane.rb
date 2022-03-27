require_relative './airport'
require_relative './weather'

class Plane
  attr_reader :location

  def initialize
    @location = :in_air
  end

  def land(airport, weather)
    raise "Airport full" if airport.full?
    raise "Stormy weather" if weather.stormy? == true
    airport.hangar.push(self)
    @location = airport
    self
  end

  def take_off(weather)
    raise "Already in the air" if @location == :in_air
    raise "Stormy weather" if weather.stormy? == true
    @location.hangar.delete(self)
    @location = :in_air
    self
  end
end
