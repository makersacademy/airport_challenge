require_relative 'airport'

class Plane
  attr_reader :location

  def initialize
    @location = "In flight"
  end

  def land(airport)
    raise("Plane not in flight") unless @location == "In flight"

    @location = airport
    "The plane has landed at #{@location}"
  end

  def take_off
    raise("Plane not at an airport") if @location == "In flight"
    
    take_off_airport = @location
    @location = "In flight"
    "The plane has taken off from #{take_off_airport}"
  end
end
