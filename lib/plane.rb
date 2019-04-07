require_relative 'airport'

class Plane
  def in_airport?
    @airport.nil? ? false : true
  end

  def land(airport)
    raise("Plane not in flight") if in_airport?
    raise("Airport does not exist") unless airport.instance_of? Airport

    @airport = airport
  end

  def take_off
    raise("Plane not at an airport") unless in_airport?

    @airport = nil
  end
end
