require_relative 'airport'

class Plane
  attr_reader :location

  def initialize
    @location = "In flight"
  end

  def land(airport)
    @location = airport
    "The plane has landed at #{@location}"
  end

  def take_off
    take_off_airport = @location
    @location = "In flight"
    "The plane has taken off from #{take_off_airport}"
  end
end
