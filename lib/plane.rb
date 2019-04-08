require_relative 'airport'
require_relative 'weather'

class Plane

  def in_airport?
    @airport.nil? ? false : true
  end

  def land(airport)
    raise("Plane not in flight") if in_airport?
    raise("Airport does not exist") unless airport.instance_of? Airport
    raise("Weather is stormy, landing not allowed") if airport.stormy?
    airport.add_plane(self)
    @airport = airport
  end

  def take_off
    raise("Plane not at an airport") unless in_airport?
    raise("Weather is stormy, take off not allowed") if @airport.stormy?
    @airport.remove_plane(self)
    @airport = nil
  end
end
