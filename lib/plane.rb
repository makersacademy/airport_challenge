require './lib/airport.rb'

class Plane
  attr_reader :location

  def initialize
    @location = nil
  end

  def land(airport)
    @location = airport
    self
  end

  def take_off
    @location = "in the air"
  end

end
