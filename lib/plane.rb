require_relative 'airport'
require_relative 'weather'

class Plane
  include Weather

  def in_airport?
    @airport.nil? ? false : true
  end

  def land(airport)
    raise("Plane not in flight") if in_airport?
    raise("Weather is stormy, landing not allowed") if stormy?
    raise("Airport does not exist") unless airport.instance_of? Airport

    @airport = airport
  end

  def take_off
    raise("Plane not at an airport") unless in_airport?
    raise("Weather is stormy, take off not allowed") if stormy?

    @airport = nil
  end
end
