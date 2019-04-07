require_relative 'airport'

class Plane
  attr_reader :location

  def initialize
    @location = "In flight"
  end

  def land(airport)
    raise("Plane not in flight") unless @location == "In flight"
    raise("Airport does not exist") unless airport.instance_of? Airport

    @location = airport
  end

  def take_off
    raise("Plane not at an airport") if @location == "In flight"

    @location = nil
  end
end
