require_relative './airport'
require_relative './weather'

class Plane
  attr_reader :location

  def initialize
    @location = :in_air
  end

  def land(airport)
    raise "Airport full" if airport.full?
    airport.hangar.push(self)
    @location = airport
    self
  end

  def take_off
    raise "Already in the air" if @location == :in_air
    weather = Weather.new
    raise "Stormy weather" if weather.stormy? == true
    @location.hangar.delete(self)
    @location = :in_air
    self
  end
end
