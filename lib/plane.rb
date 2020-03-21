require_relative 'airport'

class Plane
  def land(airport)
    raise 'Unable to land, airport is full' if airport.full?
  end

  def take_off
    "No longer in the airport"
  end
end
