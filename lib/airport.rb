require_relative 'plane'

# manages landing and leaving planes. Takes information from Weather class to
# decide whether a plane should land or take off.
class Airport

  def land(plane)
    plane.land
  end

  def take_off(plane)
    plane.take_off
  end
end
